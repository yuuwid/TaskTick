import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:tasktick/src/app/theme/color_style.dart';
import 'package:tasktick/src/pages/task/widgets/outlined_button_widget.dart';

class DatePickerWidget extends StatefulWidget {
  DateTime _selectedStartDate = DateTime.now();
  DateTime? _selectedEndDate;

  DatePickerWidget({Key? key, DateTime? startDate, DateTime? endDate})
      : super(key: key) {
    if (startDate != null) {
      _selectedStartDate = startDate;
    }
    if (endDate != null) {
      _selectedEndDate = endDate;
    }
  }

  @override
  State<DatePickerWidget> createState() => _DatePickerWidgetState();
}

class _DatePickerWidgetState extends State<DatePickerWidget>
    with TickerProviderStateMixin {
  // DateTime _selectedStartDate = DateTime.now();
  // DateTime? _selectedEndDate;
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      initialIndex: 0,
      length: 2,
      vsync: this,
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: OutlinedButtonWidget(
        title: Text(
          DateFormat("d MMM yyyy", "id_ID").format(widget._selectedStartDate),
          style: TextStyle(
            fontSize: 11,
          ),
        ),
        icon: MdiIcons.calendarOutline,
        onPressed: () => selectDatePicker(0),
      ),
    );
  }

  selectDatePicker(int initIndex) {
    DateTime _tempSelectedDate = widget._selectedStartDate;
    DateTime? _tempSelectedEndDate = widget._selectedEndDate;

    _tabController = TabController(
      initialIndex: initIndex,
      length: 2,
      vsync: this,
    );

    showDialog(
      context: context,
      builder: (_) {
        return SimpleDialog(
          contentPadding: EdgeInsets.only(top: 3),
          children: [
            Container(
              child: Column(
                children: [
                  Container(
                    child: TabBar(
                      labelPadding: EdgeInsets.symmetric(vertical: 10),
                      padding: EdgeInsets.only(top: 0),
                      controller: _tabController,
                      labelColor: primaryColor,
                      unselectedLabelColor: Colors.grey,
                      tabs: [
                        Text(
                          "Mulai",
                          style: TextStyle(fontSize: 12),
                        ),
                        Text(
                          "Selesai",
                          style: TextStyle(fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 350,
                    child: TabBarView(
                      controller: _tabController,
                      children: [
                        // START DATE
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SfDateRangePicker(
                            selectionMode: DateRangePickerSelectionMode.single,
                            initialSelectedDate: _tempSelectedDate,
                            selectionColor: primaryColor,
                            onSelectionChanged: (args) {
                              _tempSelectedDate = args.value;
                            },
                          ),
                        ),
                        // END DATE
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SfDateRangePicker(
                            initialSelectedDate: _tempSelectedEndDate,
                            selectionMode: DateRangePickerSelectionMode.single,
                            selectionColor: primaryColor,
                            onSelectionChanged: (args) {
                              _tempSelectedEndDate = args.value;
                            },
                            toggleDaySelection: true,
                            minDate: _tempSelectedDate,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text(
                            "Batal",
                            style: TextStyle(fontSize: 12, color: Colors.grey),
                          ),
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.symmetric(vertical: 6),
                            visualDensity: VisualDensity.compact,
                          ),
                        ),
                        SizedBox(width: 10),
                        TextButton(
                          onPressed: () {
                            widget._selectedStartDate = _tempSelectedDate;
                            widget._selectedEndDate = _tempSelectedEndDate;
                            setState(() {});
                            Navigator.pop(context);
                          },
                          child: Text(
                            "Pilih",
                            style: TextStyle(fontSize: 12),
                          ),
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.symmetric(vertical: 6),
                            visualDensity: VisualDensity.compact,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}


// Expanded(
//     child: OutlinedButton(
//       style: OutlinedButton.styleFrom(
//         side: BorderSide(style: BorderStyle.none),
//         visualDensity: VisualDensity.compact,
//       ),
//       onPressed: () => selectDatePicker(1),
//       child: ListTile(
//         leading: Icon(
//           MdiIcons.calendarOutline,
//           size: 20,
//         ),
//         minLeadingWidth: 20,
//         title: Text(
//           DateFormat("d MMM yyyy", "id_ID")
//               .format(_selectedEndDate!),
//           style: TextStyle(fontSize: 12),
//         ),
//         contentPadding: EdgeInsets.all(0),
//         dense: true,
//         visualDensity: VisualDensity.compact,
//       ),
//     ),
//   )