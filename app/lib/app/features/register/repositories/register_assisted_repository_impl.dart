import 'package:coopartilhar/app/features/register/entities/register_entity.dart';
import 'package:core_module/core_module.dart';

import 'package:coopartilhar/app/features/register/repositories/i_register_repository.dart';

class RegisterRepositoryImpl extends IRegisterRepository {
  RegisterRepositoryImpl({required this.client});
  final IRestClient client;

  @override
  Future<Output<RegisterEntity>> register({
    required RegisterEntity register,
  }) {
    // TODO: implement register
    throw UnimplementedError();
  }
}
