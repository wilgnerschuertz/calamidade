import 'dart:convert';
import 'package:core_module/core_module.dart';
import 'package:dashboard/app/features/home/request/interactor/repositories/request_repository.dart';

class RequestRepositoryImpl implements RequestRepository {
  final IRestClient _restClient;

  const RequestRepositoryImpl({
    required IRestClient restClient,
  }) : _restClient = restClient;

  @override
  Future<Output<List<RequestEntity>>> getRequests() async {
    try {
      final response = await _restClient
          .get(RestClientRequest(path: '/core/v1/requests?page=1&limit=1'));
      if (response.data == null) {
        return const Left(DefaultException(message: 'Requisição inválida'));
      } else {
        final data =
            List<Map<String, dynamic>>.from(jsonDecode(response.data)['data']);
        final newRequestEntities =
            data.map((e) => RequestAdapter.fromJson(e)).toList();
        return Right(newRequestEntities);
      }
    } on BaseException catch (err) {
      return Left(DefaultException(message: err.message));
    } catch (e) {
      return Left(DefaultException(message: 'Erro desconhecido: $e'));
    }
  }
}
