part of 'drawer_cubit.dart';

abstract class DrawerState extends Equatable {
  final String title;
  final DrawerOpened opened;

  DrawerState({required this.title, required this.opened});

  @override
  List<Object> get props => [title, opened];
}

class DrawerStateHome extends DrawerState {
  DrawerStateHome({required super.title, super.opened = DrawerOpened.home});

  @override
  List<Object> get props => [];
}

class DrawerStateHariIni extends DrawerState {
  DrawerStateHariIni(
      {required super.title, super.opened = DrawerOpened.hari_ini});

  @override
  List<Object> get props => [];
}

class DrawerStatePesan extends DrawerState {
  DrawerStatePesan({required super.title, super.opened = DrawerOpened.pesan});

  @override
  List<Object> get props => [];
}

class DrawerStateToDo extends DrawerState {
  DrawerStateToDo({required super.title, super.opened = DrawerOpened.todo});

  @override
  List<Object> get props => [];
}

class DrawerStateNote extends DrawerState {
  DrawerStateNote({required super.title, super.opened = DrawerOpened.note});

  @override
  List<Object> get props => [];
}
