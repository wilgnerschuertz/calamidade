import 'package:core_module/core_module.dart';

class AssistedEntity extends Entity {
  final String document, email, name, phone;
  final double latitude, longitude;

  AssistedEntity(
    super.id, {
    required this.email,
    required this.name,
    required this.document,
    required this.phone,
    required this.latitude,
    required this.longitude,
  });
}
