import 'package:coopartilhar/app/features/register/data/adapters/register_adapter.dart';
import 'package:coopartilhar/app/features/register/interactor/entities/register_entity.dart';
import 'package:coopartilhar/app/features/register/interactor/repositories/i_register_repository.dart';
import 'package:core_module/core_module.dart';

class RegisterRepositoryImpl extends IRegisterRepository {
  RegisterRepositoryImpl({required this.client});

  final IRestClient client;

  @override
  Future<Output<SessionEntity>> register({
    required RegisterEntity register,
  }) async {
    try {
      final payload = RegisterAdapter.toJson(register);

      final response = await client.post(
        RestClientRequest(
          path: '/core/v1/auth/email/register',
          data: payload,
        ),
      );

      final session = SessionAdapter.fromJson(response.data);

      return Right(session);
    } on BaseException catch (err) {
      if (err.data['erros']['email'] == 'emailAlreadyExists') {
        return const Left(DefaultException(
          message: 'Já existe uma conta vinculada a este e-mail',
        ));
      }
      if (err.data['erros']['document'] == 'documentAlreadyExists') {
        return const Left(DefaultException(
          message: 'Já existe uma conta para este documento',
        ));
      }
      return Left(DefaultException(message: err.message));
    } catch (_) {
      return const Left(DefaultException(message: 'Erro desconhecido'));
    }
  }
}
