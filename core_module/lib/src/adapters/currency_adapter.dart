import 'package:intl/intl.dart';

class CurrencyAdapter {
  static String doubleToBRL(double value) {
    final formatter = NumberFormat.currency(locale: 'pt_BR', symbol: 'R\$');

    final valueFormatted = formatter.format(value);

    return valueFormatted;
  }

  static double removeMask(String value) {
    return double.parse(value.replaceAll(RegExp('[^0-9]'), '')) / 100;
  }
}
