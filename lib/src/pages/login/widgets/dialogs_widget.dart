import 'package:formz/formz.dart';
import 'package:material_dialogs/material_dialogs.dart';
import 'package:tasktick/src/domain/bloc/login/login_bloc.dart';
import 'package:tasktick/src/pages/pages.dart';

class DialogsWidget {
  static var stateMsg = null;
  static void show(LoginState state, BuildContext context) {
    // print(state.status);
    if (state.status.isSubmissionInProgress) {
      if (stateMsg != null) {
        if ((stateMsg != state.msg)) {
          Navigator.pop(context);
        }
      }
      Dialogs.bottomMaterialDialog(
        context: context,
        isDismissible: false,
        enableDrag: false,
        barrierDismissible: false,
        msg: (state.msg == StatusLogin.connectApi)
            ? "Menghubungkan ke Server"
            : (state.msg == StatusLogin.connectLocal)
                ? "Memuat Konfigurasi Aplikasi"
                : "",
      );
      stateMsg = state.msg;
    } else if (state.status.isSubmissionFailure) {
      //! GAGAL LOGIN
      Navigator.pop(context);
      Dialogs.bottomMaterialDialog(
          context: context, title: "Gagal!", msg: "Silakan Coba Lagi.");
    } else if (state.status.isSubmissionSuccess) {
      //! BERHASIL LOGIN
      if ((state.msg == StatusLogin.done)) {
        Navigator.pop(context);
      }
      Dialogs.materialDialog(
        context: context,
        barrierDismissible: false,
        title: "Berhasil!",
        onClose: (_) {
          Navigator.of(context)
              .pushNamedAndRemoveUntil("/dashboard", (route) => false);
          return;
        },
        msg: "Tunggu Sebentar.\nAnda akan diarahkan ke halaman utama.",
      );
    }
  }
}
