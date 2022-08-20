import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:tasktick/src/pages/pages.dart';

part 'priority_state.dart';

class PriorityCubit extends Cubit<PriorityState> {
  PriorityCubit()
      : super(PriorityState(
            text: "Prioritas Rendah", icon: MdiIcons.exclamation));

  List<Map> priorityList = [
    {
      'title': "Prioritas Rendah",
      'icon': MdiIcons.exclamation,
    },
    {
      'title': "Prioritas Sedang",
      'icon': MdiIcons.progressAlert,
    },
    {
      'title': "Prioritas Rendah",
      'icon': MdiIcons.carBrakeAlert,
    },
  ];

  onChangePriority(int index) {
    Map priority = priorityList[index];
    emit(PriorityState(icon: priority['icon'], text: priority['title']));
  }
}
