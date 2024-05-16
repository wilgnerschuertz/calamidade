import 'package:coopartilhar/app/features/check_affiliated/data/adapters/check_affiliated_adapter.dart';
import 'package:coopartilhar/app/features/check_affiliated/data/adapters/document_adapter.dart';
import 'package:coopartilhar/app/features/check_affiliated/data/i_check_affiliated_repository.dart';
import 'package:coopartilhar/app/features/check_affiliated/entities/check_affiliated_entity.dart';
import 'package:core_module/core_module.dart';

class CheckAffiliatedRepositoryImpl implements ICheckAffiliatedRepository {
  final IRestClient restClient;
  CheckAffiliatedRepositoryImpl({required this.restClient});

  @override
  Future<Output<CheckAffiliatedEntity>> check(String document) async {
    try {
      //TODO: impl correct endpoint
      const url = '';
      final response = await restClient.post(
        RestClientRequest(
          path: url,
          data: DocumentAdapter.toJson(document: document),
        ),
      );
      if (response.data == null) {
        return const Left(DefaultException(message: 'Requisição inválida.'));
      }
      return Right(CheckAffiliatedAdapter.fromJson(response.data));
    } on BaseException catch (err) {
      return Left(DefaultException(message: err.message));
    } catch (_) {
      return const Left(DefaultException(message: 'Erro desconhecido'));
    }
  }
}
