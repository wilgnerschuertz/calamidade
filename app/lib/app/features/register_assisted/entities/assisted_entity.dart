import 'package:core_module/core_module.dart';

class AssistedEntity extends Entity {
  final String document, email, name, phone;
  final double latitude, longitude;

  AssistedEntity(
    super.id,
    this.email,
    this.name,
    this.document,
    this.phone,
    this.latitude,
    this.longitude,
  );
}
