import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:tasktick/src/app/theme/color_style.dart';
import 'package:tasktick/src/data/services/local/hive/adapter/adapters.dart';
import 'package:tasktick/src/domain/bloc/task/task_cubit.dart';

class TopHeadWidgets extends StatelessWidget {
  const TopHeadWidgets({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Tasks task = context.select((TaskCubit element) => element.state.task!);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2),
      child: Row(
        children: [
          Flexible(
            flex: 1,
            child: IconButton(
              onPressed: () {},
              icon: Icon(MdiIcons.formatListCheckbox),
              splashRadius: 20,
              iconSize: 20,
              color: primaryColor,
            ),
          ),
          Expanded(
            flex: 6,
            child: TextFormField(
              initialValue: task.title,
              autocorrect: false,
              autofocus: false,
              keyboardType: TextInputType.text,
              maxLines: 1,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.normal,
              ),
              decoration: InputDecoration(
                isDense: true,
                border: InputBorder.none,
                hintText: "Masukan Nama Jadwal",
                hintStyle: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),
          ),
          Flexible(
            flex: 1,
            child: IconButton(
              onPressed: () {},
              icon: Icon(MdiIcons.listStatus),
              splashRadius: 20,
              iconSize: 20,
              color: primaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
