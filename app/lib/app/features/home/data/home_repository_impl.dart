import 'package:coopartilhar/app/features/home/interactor/interfaces/i_home_repository.dart';
import 'package:core_module/core_module.dart';
import 'package:coopartilhar/app/features/home/interactor/order_entity.dart';

class HomeRepositoryImpl implements IHomeRepository {
  @override
  Future<Output<List<OrderEntity>>> getOrders() {
    // TODO: implement getOrders
    throw UnimplementedError();
  }
}
