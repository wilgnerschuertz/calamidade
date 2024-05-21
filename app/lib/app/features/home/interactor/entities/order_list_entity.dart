import 'package:coopartilhar/app/features/home/interactor/entities/order_entity.dart';
import 'package:core_module/core_module.dart';

class OrderListEntity extends Entity {
  final List<OrderEntity> orders;
  final bool hasNextPage;

  OrderListEntity({required this.orders, required this.hasNextPage}) : super(-1);
}
