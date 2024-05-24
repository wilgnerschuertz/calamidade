import 'package:core_module/core_module.dart';
import 'package:dashboard/app/features/home/request/data/adapters/request_list_adapter.dart';
import 'package:dashboard/app/features/home/request/interactor/repositories/i_request_repository.dart';

class RequestRepositoryImpl implements IRequestRepository {
  final IRestClient restClient;

  RequestRepositoryImpl({required this.restClient});

  @override
  Future<Output<RequestListEntity>> getRequests() async {
    try {
      final response = await restClient.get(RestClientRequest(
          path: '/core/v1/requests/feed?page=1&limit=10&ordering=ASC'));

      return Right(RequestListAdapter.fromJson(response.data));
    } on BaseException catch (err) {
      return Left(DefaultException(message: err.message));
    } catch (e) {
      return Left(DefaultException(message: 'Erro desconhecido: $e'));
    }
  }
}
