import 'package:intl/intl.dart';

class AppFunctions {
  static formatNumber(dynamic number) {
    double numberToFormat = 0.0;
    if (number == null || number == '') return 0;
    if (number is String) {
      numberToFormat = double.parse(number);
    } else if (number is int) {
      numberToFormat = number.toDouble();
    } else {
      numberToFormat = number;
    }
    String formattedNumber =
        NumberFormat.decimalPattern('en_US').format(numberToFormat);
    return formattedNumber;
  }
}
