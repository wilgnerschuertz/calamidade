import 'package:core_module/src/entities/auth/user_entity.dart';
import 'package:coopartilhar/app/features/check_affiliated/data/adapters/check_affiliated_adapter.dart';
import 'package:coopartilhar/app/features/check_affiliated/data/adapters/document_adapter.dart';
import 'package:coopartilhar/app/features/check_affiliated/data/errors/not_affiliated_error.dart';
import 'package:coopartilhar/app/features/check_affiliated/data/i_check_affiliated_repository.dart';
import 'package:core_module/core_module.dart';

class CheckAffiliatedRepositoryImpl implements ICheckAffiliatedRepository {
  final IRestClient restClient;
  CheckAffiliatedRepositoryImpl({required this.restClient});

  @override
  Future<Output<UserEntity>> check(String document) async {
    try {
      const url = '/core/v1/cooperateds/document/validate';
      final response = await restClient.post(
        RestClientRequest(
          path: url,
          data: DocumentAdapter.toJson(document: document),
        ),
      );

      return Right(CheckAffiliatedAdapter.fromJson(response.data));
    } on RestClientException catch (err) {
      if (err.response?.statusCode == 404) {
        return Left(NotAffiliatedError());
      }
      return const Left(DefaultException(message: 'Error desconhecido'));
    } catch (_) {
      return const Left(DefaultException(message: 'erro desconhecido'));
    }
  }
}
