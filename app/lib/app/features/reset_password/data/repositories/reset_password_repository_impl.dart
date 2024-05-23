import 'package:coopartilhar/app/features/reset_password/data/adapters/reset_password_adapter.dart';
import 'package:coopartilhar/app/features/reset_password/interactor/entities/reset_password_entity.dart';
import 'package:coopartilhar/app/features/reset_password/interactor/repositories/i_reset_password_repository.dart';
import 'package:core_module/core_module.dart';

class ResetPasswordRepositoryImpl extends IResetPasswordRepository {
  ResetPasswordRepositoryImpl({required this.client});

  final IRestClient client;

  @override
  Future<Output<Unit>> resetPassword({
    required ResetPasswordEntity resetEntity,
  }) async {
    try {
      final passToJson = ResetPasswordAdapter.toJson(resetEntity);

      final response = await client.post(
        RestClientRequest(
          path: '/core/v1/auth/reset/password',
          data: passToJson,
        ),
      );

      if (response.statusCode == 204) {
        return const Right(unit);
      }
      return const Left(
          DefaultException(message: 'Falha ao redefinir a senha.'));
    } on BaseException catch (_) {
      return const Left(DefaultException(
          message: 'Não foi possível redefinir a sua senha, tente novamente.'));
    } catch (_) {
      return const Left(DefaultException(message: 'Erro desconhecido.'));
    }
  }
}
