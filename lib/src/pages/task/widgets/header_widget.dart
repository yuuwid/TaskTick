import 'package:flutter/material.dart';
import 'package:tasktick/src/pages/task/widgets/date_time_repeat_input_widget.dart';
import 'package:tasktick/src/pages/task/widgets/top_head_widget.dart';

class HeaderWidgets extends StatelessWidget {
  const HeaderWidgets({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TopHeadWidgets(),
        DateTimeRepeatInputWidget(),
      ],
    );
  }
}
