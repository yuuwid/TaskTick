import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:tasktick/src/pages/task/widgets/modal_btm_sheet_widget.dart';
import 'package:tasktick/src/pages/task/widgets/outlined_button_widget.dart';

class RepeatPickerWidget extends StatefulWidget {
  const RepeatPickerWidget({Key? key}) : super(key: key);

  @override
  State<RepeatPickerWidget> createState() => _RepeatPickerWidgetState();
}

class _RepeatPickerWidgetState extends State<RepeatPickerWidget> {
  @override
  Widget build(BuildContext context) {
    return OutlinedButtonWidget(
      title: Text(
        "Setiap Hari",
        style: TextStyle(fontSize: 12),
      ),
      icon: MdiIcons.repeat,
      onPressed: () => selectRepeat(),
    );
  }

  selectRepeat() async {
    await showModalBottomSheet(
      context: context,
      builder: (_) {
        return ModalBottomSheetWidget();
      },
    );
  }
}
