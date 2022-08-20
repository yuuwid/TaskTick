import 'package:tasktick/src/pages/pages.dart';

class TimeFormater {
  /// Mendapatkan object [Duration] dari inputan [String] berupa Jam
  /// dengan format
  ///
  /// `Jam:Menit:Detik` --> `00:00:00`
  ///
  static Duration parseTime(String input) {
    final parts = input.split(':');

    if (parts.length != 3) throw FormatException('Invalid time format');

    int days;
    int hours;
    int minutes;
    int seconds;
    int milliseconds;
    int microseconds;

    {
      final p = parts[2].split('.');

      if (p.length != 2) throw FormatException('Invalid time format');

      final p2 = int.parse(p[1]);
      microseconds = p2 % 1000;
      milliseconds = p2 ~/ 1000;

      seconds = int.parse(p[0]);
    }

    minutes = int.parse(parts[1]);

    {
      int p = int.parse(parts[0]);
      hours = p % 24;
      days = p ~/ 24;
    }

    return Duration(
      days: days,
      hours: hours,
      minutes: minutes,
      seconds: seconds,
      milliseconds: milliseconds,
      microseconds: microseconds,
    );
  }

  /// Mendapatkan object [DateTime] dari inputan [String] berupa Jam
  /// dengan format
  ///
  /// `Jam.Menin` --> `09.00`
  ///
  /// hari, bulan, dan tahun akan mengikuti `DateTime.now()`
  ///
  static DateTime toDateTime(String timeStr) {
    List times = timeStr.split(".");

    DateTime now = DateTime.now();

    return DateTime(
      now.year,
      now.month,
      now.day,
      int.parse(times[0]),
      int.parse(times[1]),
    );
  }

  static String to24hours(TimeOfDay time) {
    final hour = time.hour.toString().padLeft(2, "0");
    final min = time.minute.toString().padLeft(2, "0");
    return "$hour:$min";
  }
}
