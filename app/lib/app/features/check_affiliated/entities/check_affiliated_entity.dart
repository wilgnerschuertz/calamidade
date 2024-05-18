import 'package:core_module/core_module.dart';

class CheckAffiliatedEntity extends Entity {
  final String name;
  final String document;
  final String email;
  final String phone;

  CheckAffiliatedEntity(
    super.id, {
    required this.name,
    required this.document,
    required this.email,
    required this.phone,
  });
}
