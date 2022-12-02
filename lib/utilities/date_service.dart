import 'package:intl/intl.dart';

class DateService {
  static String convertDateFormat({required String dateTimeString, required String oldFormat, required String newFormat}) {
    DateFormat newDateFormat = DateFormat(newFormat);
    DateTime dateTime = DateFormat(oldFormat).parse(dateTimeString);
    String selectedDate = newDateFormat.format(dateTime);
    return selectedDate;
  }

  static String getCurrentDate(String pattern) {
    DateTime now = DateTime.now();
    DateFormat formatter = DateFormat(pattern);
    String formatted = formatter.format(now);

    return formatted;
  }
}