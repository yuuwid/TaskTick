import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:tasktick/src/app/theme/color_style.dart';
import 'package:tasktick/src/pages/task/option_repeat_enum.dart';
import 'package:tasktick/src/pages/task/widgets/modal_btm_custom_widget.dart';
import 'package:tasktick/src/pages/task/widgets/repeat_picker_widget.dart';

class ModalBottomSheetWidget extends StatefulWidget {
  ModalBottomSheetWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<ModalBottomSheetWidget> createState() => _ModalBottomSheetWidgetState();
}

class _ModalBottomSheetWidgetState extends State<ModalBottomSheetWidget> {
  OptionRepeat _selectedRepeat = OptionRepeat.noRepeat;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
      child: Column(
        children: [
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Container(
                    height: 2,
                    margin: EdgeInsets.only(bottom: 10),
                    width: 90,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(50)),
                      color: primaryColor,
                    ),
                  ),
                ),
                Text("Ulangi", style: TextStyle(fontSize: 13)),
              ],
            ),
          ),
          Expanded(
            flex: 6,
            child: GridView(
              physics: ScrollPhysics(parent: NeverScrollableScrollPhysics()),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 4 / 2.5,
                crossAxisSpacing: 5,
                mainAxisSpacing: 10,
              ),
              children: [
                optionRepeat(
                  title: "Hanya hari ini",
                  icon: MdiIcons.calendarRemoveOutline,
                  value: OptionRepeat.noRepeat,
                ),
                optionRepeat(
                  title: "Setiap Hari",
                  icon: MdiIcons.calendarWeek,
                  value: OptionRepeat.everyDay,
                ),
                optionRepeat(
                  title: "Hari Kerja",
                  icon: MdiIcons.calendarRangeOutline,
                  value: OptionRepeat.weekDay,
                  selectedTitle: "Sen - Jum",
                ),
                optionRepeat(
                  title: "Akhir Pekan",
                  icon: MdiIcons.calendarWeekendOutline,
                  value: OptionRepeat.weekEnd,
                  selectedTitle: "Sab - Min",
                ),
                optionRepeat(
                  title: "Mingguan",
                  icon: MdiIcons.calendarWeekBegin,
                  value: OptionRepeat.weekly,
                  selectedTitle:
                      "Setiap ${DateFormat.EEEE("id").format(DateTime.now())}",
                ),
                optionRepeat(
                  title: "Bulanan",
                  icon: MdiIcons.calendarMonthOutline,
                  value: OptionRepeat.monthly,
                  selectedTitle:
                      "Setiap Tanggal ${DateFormat.d("id").format(DateTime.now())}",
                ),
                optionRepeat(
                  title: "Custom",
                  icon: MdiIcons.calendarPlus,
                  value: OptionRepeat.custom,
                ),
              ],
            ),
          ),
          Flexible(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                OutlinedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    "Batal",
                    style: TextStyle(
                      fontSize: 11.5,
                      color: Colors.grey,
                    ),
                  ),
                  style: OutlinedButton.styleFrom(
                    side: BorderSide.none,
                    visualDensity: VisualDensity.compact,
                  ),
                ),
                OutlinedButton(
                  onPressed: () {},
                  child: Text(
                    "Selesai",
                    style: TextStyle(
                      fontSize: 11.5,
                    ),
                  ),
                  style: OutlinedButton.styleFrom(
                    side: BorderSide.none,
                    visualDensity: VisualDensity.compact,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  OutlinedButton optionRepeat({
    required String title,
    required IconData icon,
    required OptionRepeat value,
    String? selectedTitle = "",
  }) {
    if (selectedTitle == "") {
      selectedTitle = title;
    }
    return OutlinedButton(
      onPressed: () {
        _selectedRepeat = value;
        setState(() {});
        if (_selectedRepeat == OptionRepeat.custom) {
          showModalBottomSheet(
            context: context,
            builder: (_) {
              return ModalBottomCustomWidget();
            },
          );
        }
      },
      style: OutlinedButton.styleFrom(
        backgroundColor:
            (_selectedRepeat == value) ? primaryColor : Colors.white,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Icon(
            icon,
            color: (_selectedRepeat == value) ? Colors.white : Colors.grey,
          ),
          Text(
            (_selectedRepeat == value) ? selectedTitle! : title,
            style: TextStyle(
              color: (_selectedRepeat == value) ? Colors.white : Colors.grey,
              fontSize: 12,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

