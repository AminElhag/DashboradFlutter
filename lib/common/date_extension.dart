import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';

enum MonthName {
  jan(id: 1),
  feb(id: 2),
  mar(id: 3),
  apr(id: 4),
  may(id: 5),
  jun(id: 6),
  jul(id: 7),
  aug(id: 8),
  sept(id: 9),
  oct(id: 10),
  nov(id: 11),
  dec(id: 12);

  const MonthName({required this.id});

  final int id;

  int getId() => id;

  static String getMonthName(int monthId) {
    if (MonthName.jan.id == monthId) {
      return "Jan";
    } else if (MonthName.feb.id == monthId) {
      return "Feb";
    } else if (MonthName.mar.id == monthId) {
      return "Mar";
    } else if (MonthName.apr.id == monthId) {
      return "Apr";
    } else if (MonthName.may.id == monthId) {
      return "May";
    } else if (MonthName.jun.id == monthId) {
      return "Jun";
    } else if (MonthName.jul.id == monthId) {
      return "Jul";
    } else if (MonthName.aug.id == monthId) {
      return "Aug";
    } else if (MonthName.sept.id == monthId) {
      return "Sept";
    } else if (MonthName.oct.id == monthId) {
      return "Oct";
    } else if (MonthName.nov.id == monthId) {
      return "Nov";
    } else if (MonthName.dec.id == monthId) {
      return "Dec";
    } else {
      return "";
    }
  }
}

class DateExtension {
  static DateTime getDateTimeFormString(String string) {
    try {
      return DateTime.parse(string);
    } on Exception catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
      rethrow;
    }
  }

  static int getTheYearFormString(String string) {
    DateTime dateTime = getDateTimeFormString(string);
    return dateTime.year;
  }

  static String getTheMonthFromString(String string) {
    DateTime dateTime = getDateTimeFormString(string);
    var month = dateTime.month;
    return MonthName.getMonthName(month);
  }

  static int getTheDayFromString(String string) {
    DateTime dateTime = getDateTimeFormString(string);
    return dateTime.day;
  }

  static String getFullDateFromString(String string) {
    DateTime dateTime = getDateTimeFormString(string);
    final dateFormat = DateFormat('dd MMM yyyy - hh:mm a');
    return dateFormat.format(dateTime);
  }
}
