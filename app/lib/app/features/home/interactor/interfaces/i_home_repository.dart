import 'package:coopartilhar/app/features/home/interactor/order_entity.dart';
import 'package:core_module/core_module.dart';

abstract class IHomeRepository {
  Future<Output<List<OrderEntity>>> getOrders();
}
