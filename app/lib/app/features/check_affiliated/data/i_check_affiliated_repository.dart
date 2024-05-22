import 'package:core_module/src/entities/auth/user_entity.dart';
import 'package:core_module/core_module.dart';

abstract class ICheckAffiliatedRepository {
  Future<Output<UserEntity>> check(String document);
}
