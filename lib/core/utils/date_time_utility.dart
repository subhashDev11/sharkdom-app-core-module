import 'package:intl/intl.dart';

class DateTimeUtility {
  static String getFormatTedDate(DateTime dateTime) {
    return DateFormat("yyyy-MM-dd").format(dateTime);
  }

  static DateTime? getDateFromString(String dateTime) {
    return DateFormat("yyyy-MM-dd").parse(dateTime);
  }
}
