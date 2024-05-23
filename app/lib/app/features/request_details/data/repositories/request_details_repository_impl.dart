

import 'package:coopartilhar/app/features/request_details/interactor/repositories/i_request_details_repository.dart';
import 'package:core_module/core_module.dart';

class RequestDetailsRepositoryImpl implements IRequestDetailsRepository {
  final IRestClient restClient;

  RequestDetailsRepositoryImpl(this.restClient);

  @override
  Future<Output<RequestEntity>> getRequestById(String id) async {
    try {
      final response = await restClient
          .get(RestClientRequest(path: '/core/v1/requests/$id'));

      return Right(RequestAdapter.fromJson(response.data!));
    } on RestClientException catch (err) {
      if (err.statusCode == 401) {
        return const Left(DefaultException(message: 'Não autorizado!'));
      }
      return const Left(
          DefaultException(message: 'Verifique a conexão e tente novamente'));
    } catch (e) {
      return const Left(DefaultException(message: 'Erro desconhecido'));
    }
  }

  @override
  Future<Output<Unit>> patronize(RequestEntity request, int godFatherId) async {
    try {
      await restClient.patch(
        RestClientRequest(
          path: '/core/v1/requests/${request.id}',
          data:
              RequestAdapter.toJson(request: request, godFatherId: godFatherId),
        ),
      );

      return const Right(unit);
    } on RestClientException catch (err) {
      if (err.statusCode == 401) {
        return const Left(DefaultException(message: 'Não autorizado!'));
      }
      return const Left(
          DefaultException(message: 'Verifique a conexão e tente novamente'));
    } catch (e) {
      return const Left(DefaultException(message: 'Erro desconhecido'));
    }
  }
}
