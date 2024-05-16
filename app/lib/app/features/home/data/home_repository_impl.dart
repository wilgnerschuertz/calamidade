import 'package:coopartilhar/app/features/home/data/order_adapter.dart';
import 'package:coopartilhar/app/features/home/interactor/home_interactor.dart';
import 'package:coopartilhar/app/features/home/interactor/interfaces/i_home_repository.dart';
import 'package:core_module/core_module.dart';
import 'package:coopartilhar/app/features/home/interactor/order_entity.dart';

class HomeRepositoryImpl implements IHomeRepository {
  final IRestClient restClient;

  const HomeRepositoryImpl(this.restClient);

  @override
  Future<Output<List<OrderEntity>>> getOrders(TagType tagType) async {
    try {
      final response = await restClient.get(RestClientRequest(path: '/feed'));

      final listOrders = List<OrderEntity>.from(
        response.data
          ..where((element) => element.tag == tagType.name)
          ..map(
            (e) => OrderAdapter.fromJson(e),
          ),
      );

      return Right(listOrders);
    } on RestClientException catch (e) {
      return Left(e);
    }
  }
}
