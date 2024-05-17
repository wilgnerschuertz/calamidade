import 'package:coopartilhar/app/features/register/entities/register_entity.dart';
import 'package:coopartilhar/app/features/register/data/repositories/i_register_repository.dart';
import 'package:coopartilhar/app/features/register/data/adapters/register_adapter.dart';
import 'package:core_module/core_module.dart';

class RegisterRepositoryImpl extends IRegisterRepository {
  RegisterRepositoryImpl({required this.client});

  final IRestClient client;
  final String url = '';

  @override
  Future<Output<Unit>> register({
    required RegisterEntity register,
  }) async {
    try {
      final response = await client.post(
        RestClientRequest(
          path: '$url/auth/email/register',
          data: RegisterAdapter.toJson(register),
        ),
      );

      if (response.statusCode == 204) {
        return const Right(unit);
      }
      return const Left(DefaultException(message: 'Falha ao realizar registro'));
    } on BaseException catch (err) {
      return Left(DefaultException(message: err.message));
    } catch (_) {
      return const Left(DefaultException(message: 'Erro desconhecido'));
    }
  }
}
