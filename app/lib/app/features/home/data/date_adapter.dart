import 'package:coopartilhar/app/features/home/interactor/order_entity.dart';

class DateAdapter {
  static String dateToString(OrderEntity orderEntity) {
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

    return '${orderEntity.date.day} de ${dates[orderEntity.date.month]} ${orderEntity.date.hour}:h';
  }
}
