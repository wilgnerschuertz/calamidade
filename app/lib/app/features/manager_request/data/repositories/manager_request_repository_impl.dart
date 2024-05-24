import 'package:coopartilhar/app/features/manager_request/data/adapters/request_list_adapter.dart';
import 'package:coopartilhar/app/features/manager_request/interactor/entities/request_list_entity.dart';
import 'package:coopartilhar/app/features/manager_request/interactor/repositories/i_manager_request_repository.dart';
import 'package:core_module/core_module.dart';

class ManagerRequestRepositoryImpl implements IManagerRequestRepository {
  final IRestClient restClient;

  const ManagerRequestRepositoryImpl(this.restClient);

  @override
  Future<Output<RequestListEntity>> getRequests() async {
    try {
      final response = await restClient.get(RestClientRequest(
          path: '/core/v1/requests/list?page=1&limit=10&ordering=ASC'));

      return Right(RequestListAdapter.fromJson(response.data));
    } on BaseException catch (err) {
      return Left(DefaultException(message: err.data));
    } catch (_) {
      return const Left(DefaultException(message: 'Erro desconhecido'));
    }
  }
}
