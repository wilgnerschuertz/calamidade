import 'package:coopartilhar/app/features/home/data/order_adapter.dart';
import 'package:coopartilhar/app/features/home/interactor/home_interactor.dart';
import 'package:coopartilhar/app/features/home/interactor/interfaces/i_home_repository.dart';
import 'package:core_module/core_module.dart';
import 'package:coopartilhar/app/features/home/interactor/order_entity.dart';

class HomeRepositoryImpl implements IHomeRepository {
  final IRestClient restClient;

  const HomeRepositoryImpl(this.restClient);

  @override
  Future<Output<List<OrderEntity>>> getOrders(CategoryHelp category) async {
    final response = await restClient.get(RestClientRequest(path: '/feed'));

    return Either.cond<BaseException, List<OrderEntity>>(
      response.statusCode == 200,
      DefaultException(message: ''),
      List<OrderEntity>.from(
        response.data.map(
          (e) => OrderAdapter.fromJson(e),
        ),
      ),
    );
  }
}
