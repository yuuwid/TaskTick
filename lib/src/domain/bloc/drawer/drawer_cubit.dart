import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tasktick/src/pages/drawer/drawer_home.dart';

part 'drawer_state.dart';

class DrawerCubit extends Cubit<DrawerState> {
  DrawerCubit() : super(DrawerStateHariIni(title: "Hari ini"));

  void toHome() => emit(DrawerStateHome(title: ""));
  void toHariIni() => emit(DrawerStateHariIni(title: "Hari ini"));
  void toPesan() => emit(DrawerStatePesan(title: "Pesan"));
  void toToDo() => emit(DrawerStateToDo(title: "ToDo"));
  void toNote() => emit(DrawerStateNote(title: "Catatan"));
}
