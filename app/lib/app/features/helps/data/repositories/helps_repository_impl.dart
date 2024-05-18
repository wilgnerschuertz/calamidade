import 'package:coopartilhar/app/features/helps/data/adapters/helps_adapter.dart';
import 'package:coopartilhar/app/features/helps/interactor/entities/helps_entity.dart';
import 'package:coopartilhar/app/features/helps/interactor/exceptions/helps_exception.dart';
import 'package:coopartilhar/app/features/helps/interactor/repositories/i_helps_repository.dart';
import 'package:core_module/core_module.dart';

class HelpsRepositoryImpl implements IHelpsRepository {
  const HelpsRepositoryImpl({
    required this.restClient,
  });

  final IRestClient restClient;

  @override
  Future<Output<HelpsEntity>> fetchData() async {
    try {
      final response = await restClient.post(
        RestClientRequest(
          path: '',
          data: {},
        ),
      );

      return Right(HelpsAdapter.fromJson(response.data));
    } on BaseException catch (err) {
      return Left(HelpsException(message: err.message));
    } catch (_) {
      return const Left(DefaultException(message: 'Erro desconhecido'));
    }
  }
}