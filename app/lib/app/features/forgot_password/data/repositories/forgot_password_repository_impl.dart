import 'package:coopartilhar/app/features/forgot_password/data/adapters/forgot_password_adapter.dart';
import 'package:coopartilhar/app/features/forgot_password/interactor/entities/forgot_password_entity.dart';
import 'package:coopartilhar/app/features/forgot_password/interactor/repositories/i_forgot_password_repository.dart';
import 'package:core_module/core_module.dart';

class ForgotPasswordRepositoryImpl extends IForgotPasswordRepository {
  ForgotPasswordRepositoryImpl({required this.client});

  final IRestClient client;

  @override
  Future<Output<Unit>> sendEmailPass({
    required ForgotPasswordEntity forgotEntity,
  }) async {
    try {
      final passToJson = ForgotPasswordAdapter.toJson(forgotEntity);

      final response = await client.post(
        RestClientRequest(
          path: '/core/v1/auth/forgot/password',
          data: passToJson,
        ),
      );

      if (response.statusCode == 204) {
        return const Right(unit);
      }
      return const Left(
          DefaultException(message: 'Falha ao verificar o código.'));
    } on BaseException catch (_) {
      return const Left(DefaultException(message: 'O código está inválido.'));
    } catch (_) {
      return const Left(DefaultException(message: 'Erro desconhecido.'));
    }
  }
}
