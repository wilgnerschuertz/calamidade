import 'package:coopartilhar/app/features/home/data/cooperated_adapter.dart';
import 'package:coopartilhar/app/features/home/interactor/order_entity.dart';

abstract class OrderAdapter {
  static OrderEntity fromJson(Map<String, dynamic> json) => OrderEntity(
        id: json['id'],
        tag: json['tag'],
        title: json['title'],
        helpType: json['helpType'],
        address: json['address'],
        amount: json['amount'],
        status: json['status'],
        obs: json['obs'],
        telephone: json['telephone'],
        cooperated: json['cooperated'] != null
            ? CooperatedAdapter.fromJson(json['cooperated'])
            : null,
        godfather: json['godfather'],
        createdAt: json['createdAt'],
        chavePix: json['chavePix'],
        banco: json['banco'],
        agencia: json['agencia'],
        conta: json['conta'],
      );
}
