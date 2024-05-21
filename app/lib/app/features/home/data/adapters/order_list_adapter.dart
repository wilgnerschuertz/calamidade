import 'package:coopartilhar/app/features/home/data/adapters/order_adapter.dart';
import 'package:coopartilhar/app/features/home/interactor/entities/order_list_entity.dart';

class OrderListAdapter {
  static OrderListEntity fromJson(Map<String, dynamic> json) {
    return OrderListEntity(
      orders: (json['data'] as List).map((entity) {
        return OrderAdapter.fromJson(entity);
      }).toList(),
      hasNextPage: json['hasNextPage'],
    );
  }
}
