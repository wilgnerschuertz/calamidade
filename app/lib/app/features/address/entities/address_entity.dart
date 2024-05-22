import 'package:core_module/core_module.dart';

class AddressEntity extends Entity {
  String addressName;
  String street;
  String complement;
  String number;
  String city;
  String uf;
  String cep;
  String locationLatitude;
  String locationLongitude;

  AddressEntity(
    super.id, {
    required this.addressName,
    required this.street,
    required this.complement,
    required this.number,
    required this.city,
    required this.uf,
    required this.cep,
    required this.locationLatitude,
    required this.locationLongitude,
  });
}
