import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:tasktick/src/app/theme/color_style.dart';
import 'package:tasktick/src/app/utils/time_formater.dart';
import 'package:tasktick/src/pages/task/widgets/outlined_button_widget.dart';

class TimePickerWidget extends StatefulWidget {
  const TimePickerWidget({Key? key}) : super(key: key);

  @override
  State<TimePickerWidget> createState() => _TimePickerWidgetState();
}

class _TimePickerWidgetState extends State<TimePickerWidget> {
  TimeOfDay _selectedTime = TimeOfDay(hour: 6, minute: 0);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: OutlinedButtonWidget(
        title: Text(
          "${TimeFormater.to24hours(_selectedTime)}",
          style: TextStyle(fontSize: 12),
        ),
        icon: MdiIcons.clockOutline,
        onPressed: () => selectTimePicker(),
      ),
    );
  }

  selectTimePicker() async {
    final TimeOfDay? timeOfDay = await showTimePicker(
      context: context,
      initialTime: _selectedTime,
      hourLabelText: "Jam",
      minuteLabelText: "Menit",
      initialEntryMode: TimePickerEntryMode.input,
      helpText: "Pilih Waktu",
      builder: (context, Widget? child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(
            alwaysUse24HourFormat: true,
          ),
          child: Theme(
            data: ThemeData.light().copyWith(
              colorScheme: ColorScheme.light(
                primary: primaryColor,
                onSurface: Colors.black,
              ),
              buttonTheme: ButtonThemeData(
                colorScheme: ColorScheme.light(
                  primary: Colors.green,
                ),
              ),
            ),
            child: child!,
          ),
        );
      },
    );

    if (timeOfDay != null && timeOfDay != _selectedTime) {
      setState(() {
        _selectedTime = timeOfDay;
      });
    }
  }
}
