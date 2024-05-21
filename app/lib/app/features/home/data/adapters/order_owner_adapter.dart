import 'package:coopartilhar/app/features/home/interactor/entities/order_owner_entity.dart';

class OrderOwnerAdapter {
  static OrderOwnerEntity fromJson(Map<String, dynamic> json) =>
      OrderOwnerEntity(json['id'] ?? -1);
}
