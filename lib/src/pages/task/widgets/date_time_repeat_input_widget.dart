// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:tasktick/src/data/services/local/hive/adapter/adapters.dart';
import 'package:tasktick/src/domain/bloc/task/task_cubit.dart';
import 'package:tasktick/src/pages/task/widgets/date_picker_widget.dart';
import 'package:tasktick/src/pages/task/widgets/repeat_picker_widget.dart';
import 'package:tasktick/src/pages/task/widgets/time_picker_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DateTimeRepeatInputWidget extends StatelessWidget {
  DateTimeRepeatInputWidget({
    Key? key,
  }) : super(key: key);

  GlobalKey<FormState> _oFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Tasks task = context.select((TaskCubit element) => element.state.task!);

    return Container(
      key: _oFormKey,
      child: Column(
        children: [
          Row(
            children: [
              DatePickerWidget(
                startDate: task.startedAt,
                endDate: task.endedAt,
              ),
              TimePickerWidget(),
            ],
          ),
          RepeatPickerWidget(),
        ],
      ),
    );
  }
}
