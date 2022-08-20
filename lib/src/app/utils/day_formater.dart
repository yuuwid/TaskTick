import 'package:intl/intl.dart';
import 'package:time/time.dart';

class Days {
  late DateTime dateTime;
  late String date; // yyyy-MM-dd
  late String time; // hh:mm:ss
  late String dayName;
  late int indexOfDay;

  Days({
    required this.dateTime,
    required this.date,
    required this.time,
    required this.dayName,
    required this.indexOfDay,
  });

  Days.now() {
    dateTime = DateTime.now();
    dayName = DateFormat("EEEE").format(dateTime);
    date = DateFormat("yyyy-MM-dd").format(dateTime);
    time = DateFormat('hh:mm:ss').format(dateTime);
    indexOfDay = DayFormater.getIndexbyName(dayName);
  }

  Days.nextSunday() {
    DateTime now = DateTime.now();
    if (DateFormat.EEEE().format(now) == "Sunday") {
      dateTime = now.add(Duration(days: DateTime.daysPerWeek));
    } else {
      dateTime = now.add(Duration(days: DateTime.daysPerWeek - now.weekday));
    }
    dayName = DateFormat("EEEE").format(dateTime);
    date = DateFormat("yyyy-MM-dd").format(dateTime);
    time = DateFormat('hh:mm:ss').format(dateTime);
    indexOfDay = DayFormater.getIndexbyName(dayName);
  }

  Days.prevSunday() {
    DateTime now = DateTime.now();
    if (DateFormat.EEEE().format(now) == "Sunday") {
      dateTime = now;
    } else {
      int currentDay = now.weekday;
      dateTime = now.subtract(Duration(days: currentDay));
    }
    dayName = DateFormat("EEEE").format(dateTime);
    date = DateFormat("yyyy-MM-dd").format(dateTime);
    time = DateFormat('hh:mm:ss').format(dateTime);
    indexOfDay = DayFormater.getIndexbyName(dayName);
  }

  Days.dateTime(DateTime date) {
    dateTime = date;
    dayName = DateFormat("EEEE").format(date);
    this.date = DateFormat("yyyy-MM-dd").format(date);
    time = DateFormat('hh:mm:ss').format(date);
    indexOfDay = DayFormater.getIndexbyName(dayName);
  }

  Days.dateNumber(int date, [int month = 0, int year = 0]) {
    DateTime now = DateTime.now();
    dateTime = DateTime(
      (year != 0) ? year : now.year,
      (month != 0) ? month : now.month,
      date,
    );
    dayName = DateFormat("EEEE").format(dateTime);
    this.date = DateFormat("yyyy-MM-dd").format(dateTime);
    time = DateFormat('hh:mm:ss').format(dateTime);
    indexOfDay = DayFormater.getIndexbyName(dayName);
  }

  Days.indexDay(int indexOfDay) {
    dateTime = Days.prevSunday().dateTime.add(Duration(days: indexOfDay));
    dayName = DateFormat("EEEE").format(dateTime);
    date = DateFormat("yyyy-MM-dd").format(dateTime);
    time = DateFormat('hh:mm:ss').format(dateTime);
    indexOfDay = DayFormater.getIndexbyName(dayName);
  }

  int compare(Days days) {
    return this.date.compareTo(days.date);
  }

  Map toMap() {
    return {
      'dateTime': dateTime,
      'date': date,
      'time': time,
      'dayName': dayName,
      'indexOfDay': indexOfDay,
    };
  }
}

class DayFormater {
  /// Mendapatkan format Hari dan Index Hari dalam Bahasa Indonesia [DayFormater]
  /// ```
  /// DayFormater.indo("Sunday") // Minggu
  /// ```
  static String indo(String dayInEng) {
    switch (dayInEng) {
      case "Monday":
        return "Senin";
      case "Tuesday":
        return "Selasa";
      case "Wednesday":
        return "Rabu";
      case "Thursday":
        return "Kamis";
      case "Friday":
        return "Jumat";
      case "Saturday":
        return "Sabtu";
      default:
        return "Minggu";
    }
  }

  /// Mendapatkan Index Hari dengan inputan [String] Nama Hari dalam bahasa indonesia
  ///
  /// String [day]
  /// ```
  /// DayFormater.getIndexbyName("Senin") // 1
  /// ```
  static int getIndexbyName(String day) {
    switch (day) {
      case "Monday":
        return 1;
      case "Tuesday":
        return 2;
      case "Wednesday":
        return 3;
      case "Thursday":
        return 4;
      case "Friday":
        return 5;
      case "Saturday":
        return 6;
      default:
        return 0;
    }
  }

  /// Mendapatkan Nama Hari dalam bahasa indonesia dengan inputan [int] index hari
  ///
  /// int [indexOfDay] : 0, 1, 2, 3, ..., 6
  /// ```
  /// DayFormater.getNamebyIndex(0) // "Minggu"
  /// ```
  static String getNamebyIndex(int indexOfDay) {
    switch (indexOfDay) {
      case 1:
        return "Senin";
      case 2:
        return "Selasa";
      case 3:
        return "Rabu";
      case 4:
        return "Kamis";
      case 5:
        return "Jumat";
      case 6:
        return "Sabtu";
      default:
        return "Minggu";
    }
  }
}
