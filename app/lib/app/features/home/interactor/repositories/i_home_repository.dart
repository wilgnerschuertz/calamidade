import 'package:core_module/core_module.dart';

abstract class IHomeRepository {
  Future<Output<RequestListEntity>> getOrders();
}
