import 'package:intl/intl.dart';

class CurrencyAdapter {
  static String doubleToBRL(double value) {
    final formatter = NumberFormat.currency(locale: 'pt_BR', symbol: 'R\$');

    final valueFormatted = formatter.format(value);

    return valueFormatted;
  }
}
