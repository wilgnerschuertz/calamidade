import 'package:coopartilhar/app/features/home/data/adapters/order_list_adapter.dart';
import 'package:coopartilhar/app/features/home/interactor/entities/order_list_entity.dart';
import 'package:coopartilhar/app/features/home/interactor/repositories/i_home_repository.dart';
import 'package:core_module/core_module.dart';

class HomeRepositoryImpl implements IHomeRepository {
  final IRestClient restClient;

  const HomeRepositoryImpl(this.restClient);

  @override
  Future<Output<OrderListEntity>> getOrders() async {
    try {
      /// TODO: Back-end ainda não tem API pra essa tela. Sera `/feed`_
      final response = await restClient.get(RestClientRequest(
          path: '/core/v1/requests?page=1&limit=10&ordering=ASC'));

      return Right(OrderListAdapter.fromJson(response.data));
    } on RestClientException catch (e) {
      return Left(e);
    }
  }
}
