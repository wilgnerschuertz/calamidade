import 'package:coopartilhar/app/features/home/data/adapters/request_list_adapter.dart';
import 'package:coopartilhar/app/features/home/interactor/repositories/i_home_repository.dart';
import 'package:core_module/core_module.dart';

class HomeRepositoryImpl implements IHomeRepository {
  final IRestClient restClient;

  const HomeRepositoryImpl(this.restClient);

  @override
  Future<Output<RequestListEntity>> getOrders() async {
    try {
      final response = await restClient.get(RestClientRequest(
          path: '/core/v1/requests/feed?page=1&limit=10&ordering=ASC'));

      return Right(RequestListAdapter.fromJson(response.data));
    } on RestClientException catch (e) {
      return Left(e);
    }
  }
}
