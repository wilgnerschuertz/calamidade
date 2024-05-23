import 'package:core_module/core_module.dart';

class AddressEntity extends Entity {
  String? addressName;
  String? street;
  String? complement;
  String? number;
  String? city;
  String? uf;
  String? cep;
  String? locationLatitude;
  String? locationLongitude;
  int? userId;

  AddressEntity(
    super.id, {
    this.addressName,
    this.street,
    this.complement,
    this.number,
    this.city,
    this.uf,
    this.cep,
    this.locationLatitude,
    this.locationLongitude,
    this.userId,
  });
}
