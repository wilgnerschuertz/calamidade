import 'package:coopartilhar/app/features/home/interactor/entities/request_list_entity.dart';
import 'package:core_module/core_module.dart';

abstract class IHomeRepository {
  Future<Output<RequestListEntity>> getOrders();
}
