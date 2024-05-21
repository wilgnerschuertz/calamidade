import 'package:coopartilhar/app/features/home/interactor/entities/order_list_entity.dart';
import 'package:core_module/core_module.dart';

abstract class IHomeRepository {
  Future<Output<OrderListEntity>> getOrders();
}
