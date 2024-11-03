import 'package:intl/intl.dart';

class Utils {
  static String formatDate(String date) {
    return DateFormat("dd.MM.yyyy").format(DateTime.parse(date)).toString();
  }

  static formatNumberOfNights(
    int howMany,
  ) {
    return Intl.plural(
      howMany,
      zero: '$howMany ночей',
      one: '$howMany ночь',
      two: '$howMany ночи',
      few: '$howMany ночи',
      other: '$howMany ночей',
      locale: "RU",
    );
  }
}
