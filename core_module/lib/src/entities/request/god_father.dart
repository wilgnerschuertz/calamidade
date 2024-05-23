import 'package:core_module/src/entities/entity.dart';

class GodFather extends Entity {
  final String email;
  final String firstName;
  final String lastName;
  final String document;
  final String phone;
  final String photo;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? deleteAt;

  GodFather({
    required int id,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.document,
    required this.phone,
    required this.photo,
    required this.createdAt,
    required this.updatedAt,
    required this.deleteAt,
  }) : super(id);
}
