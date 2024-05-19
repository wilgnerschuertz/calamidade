import 'package:coopartilhar/app/features/request_details/data/adapters/request_details_adapter.dart';
import 'package:coopartilhar/app/features/request_details/data/i_request_details_repository.dart';
import 'package:coopartilhar/app/features/request_details/entities/request_details_entity.dart';
import 'package:core_module/core_module.dart';

class RequestDetailsRepositoryImpl implements IRequestDetailsRepository {
  final IRestClient restClient;

  RequestDetailsRepositoryImpl(this.restClient);

  @override
  Future<Output<RequestDetailsEntity>> getRequestById(String id) async {
    try {
      const url = '/core/v1/requests/';
      final response = await restClient.get(RestClientRequest(path: '$url$id'));
      if (response.data == null) {
        throw const DefaultException(message: 'Requisição inválida');
      }
      return Right(RequestDetailsAdapter.fromJson(response.data!));
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
