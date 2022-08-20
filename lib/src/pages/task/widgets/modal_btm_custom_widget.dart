import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:tasktick/src/app/theme/color_style.dart';
import 'package:tasktick/src/app/utils/day_formater.dart';



class ModalBottomCustomWidget extends StatefulWidget {
  const ModalBottomCustomWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<ModalBottomCustomWidget> createState() =>
      _ModalBottomCustomWidgetState();
}

class _ModalBottomCustomWidgetState extends State<ModalBottomCustomWidget> {
  List<String> _numItems = List.generate(100, (index) => "${index + 1}");

  List<String> _optionItem = ["Hari", "Minggu", "Bulan", "Tahun"];

  String _selectedNumValue = "1";
  String _selectedOption = "Hari";

  bool _skipWeekend = false;

  List _days = ["Min", "Sen", "Sel", "Rab", "Kam", "Jum", "Sab"];

  List<int> _selectedDay = [Days.now().indexOfDay];

  String _selectedDate = Days.now().dateTime.day.toString();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
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
                Text("Ulangi (Custom)", style: TextStyle(fontSize: 13)),
              ],
            ),
          ),
          Expanded(
            flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Flexible(
                      child: DropdownButtonFormField2(
                        decoration: InputDecoration(
                          isDense: true,
                          border: InputBorder.none,
                        ),
                        value: _selectedNumValue,
                        customButton: Container(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                            border: Border.all(color: Colors.black12),
                          ),
                          child: Text(
                            _selectedNumValue,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: primaryColor,
                              fontSize: 13,
                            ),
                          ),
                        ),
                        onChanged: (value) {
                          setState(() {
                            _selectedNumValue = value as String;
                          });
                        },
                        items: _numItems
                            .map(
                              (item) => DropdownMenuItem<String>(
                                value: item,
                                child: Text(
                                  item,
                                  style: const TextStyle(
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                            )
                            .toList(),
                        dropdownWidth: 85,
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: DropdownButtonFormField2(
                        decoration: InputDecoration(
                          isDense: true,
                          border: InputBorder.none,
                        ),
                        value: _selectedOption,
                        customButton: Container(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                            border: Border.all(color: Colors.black12),
                          ),
                          child: Text(
                            _selectedOption,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: primaryColor,
                              fontSize: 13,
                            ),
                          ),
                        ),
                        onChanged: (value) {
                          setState(() {
                            _selectedOption = value as String;
                          });
                        },
                        items: _optionItem
                            .map(
                              (item) => DropdownMenuItem<String>(
                                value: item,
                                child: Text(
                                  item,
                                  style: const TextStyle(
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                            )
                            .toList(),
                      ),
                    ),
                    Flexible(
                      flex: 2,
                      child: Text("Sekali"),
                    ),
                  ],
                ),
                if (_selectedOption == _optionItem[0])
                  Container(
                    child: Row(
                      children: [
                        Transform.scale(
                          scale: 0.8,
                          child: Checkbox(
                            activeColor: primaryColor,
                            value: _skipWeekend,
                            splashRadius: 15,
                            onChanged: (value) {
                              _skipWeekend = !_skipWeekend;
                              setState(() {});
                            },
                          ),
                        ),
                        Text(
                          "Skip Akhir Pekan",
                          style: TextStyle(fontSize: 12),
                        ),
                      ],
                    ),
                  )
                else if (_selectedOption == _optionItem[1])
                  Container(
                    padding: EdgeInsets.only(top: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: _days
                          .map(
                            (day) => GestureDetector(
                              onTap: () {
                                int indexOfDay = _days.indexOf(day);
                                if (_selectedDay.contains(indexOfDay)) {
                                  _selectedDay.remove(indexOfDay);
                                } else {
                                  _selectedDay.add(indexOfDay);
                                  _selectedDay.sort();
                                }
                                setState(() {});
                              },
                              child: AnimatedContainer(
                                duration: Duration(milliseconds: 150),
                                padding: EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(),
                                  color: (_selectedDay
                                          .contains(_days.indexOf(day)))
                                      ? primaryColor
                                      : Colors.white,
                                ),
                                child: Text(
                                  "${day}",
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: (_selectedDay
                                            .contains(_days.indexOf(day)))
                                        ? Colors.white
                                        : primaryColor,
                                  ),
                                ),
                              ),
                            ),
                          )
                          .toList(),
                    ),
                  )
                else if (_selectedOption == _optionItem[2])
                  Container(
                    padding: EdgeInsets.only(top: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Flexible(
                          child: Text(
                            "Setiap Tanggal",
                            style: TextStyle(fontSize: 12),
                          ),
                        ),
                        Expanded(
                          child: DropdownButtonFormField2(
                            decoration: InputDecoration(
                              isDense: true,
                              border: InputBorder.none,
                            ),
                            value: _selectedDate,
                            customButton: Container(
                              padding: const EdgeInsets.symmetric(vertical: 8),
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5)),
                                border: Border.all(color: Colors.black12),
                              ),
                              child: Text(
                                _selectedDate,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: primaryColor,
                                  fontSize: 13,
                                ),
                              ),
                            ),
                            onChanged: (value) {
                              setState(() {
                                _selectedDate = value as String;
                              });
                            },
                            items: List.generate(
                              31,
                              (index) => DropdownMenuItem<String>(
                                value: "${index + 1}",
                                child: Text(
                                  "${index + 1}",
                                  style: const TextStyle(
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                else if (_selectedOption == _optionItem[3])
                  Center(
                    child: Text("Akan Hadir"),
                  )
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
}
