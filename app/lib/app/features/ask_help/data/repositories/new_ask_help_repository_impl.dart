import 'package:coopartilhar/app/features/ask_help/data/adapters/new_ask_help_adapter.dart';
import 'package:coopartilhar/app/features/ask_help/entities/solicitation_entity.dart';
import 'package:coopartilhar/app/features/ask_help/interactor/repositories/i_new_ask_help_repository.dart';
import 'package:core_module/src/entities/auth/user_entity.dart';
import 'package:core_module/core_module.dart';

class NewAskHelpRepositoryImpl implements INewAskHelpRepository {
  final IRestClient restClient;
  NewAskHelpRepositoryImpl(this.restClient);

  @override
  Future<Output<Unit>> saveSolicitation(
    SolicitationEntity solicitationEntity,
    UserEntity user,
  ) async {
    try {
      await restClient.post(
        RestClientRequest(
          path: '/core/v1/requests',
          data: NewAskHelpAdapter.toJson(solicitationEntity, user),
        ),
      );
      return const Right(unit);
    } on BaseException catch (err) {
      return Left(err);
    } catch (_) {
      return const Left(
          DefaultException(message: 'Ocorreu um erro inesperado.'));
    }
  }
}
