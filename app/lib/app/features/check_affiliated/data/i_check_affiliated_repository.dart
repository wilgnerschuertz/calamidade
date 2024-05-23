import 'package:core_module/core_module.dart';

abstract class ICheckAffiliatedRepository {
  Future<Output<UserEntity>> check(String document);
}
