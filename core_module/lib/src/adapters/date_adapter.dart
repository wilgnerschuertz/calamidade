import 'package:intl/intl.dart';

class DateAdapter {
  static String dateToString(DateTime dateTime) {
    const Map<int, String> dates = {
      1: 'Janeiro',
      2: 'Fevereiro',
      3: 'Março',
      4: 'Abril',
      5: 'Maio',
      6: 'Junho',
      7: 'Julho',
      8: 'Agosto',
      9: 'Setembro',
      10: 'Outubro',
      11: 'Novembro',
      12: 'Dezembro',
    };

    return '${dateTime.day} de ${dates[dateTime.month]} às ${dateTime.hour}h';
  }

  static String dateAndHour(DateTime dateTime) {
    final format = DateFormat("dd/MM 'às' HH'h'");

    return format.format(dateTime);
  }
}
