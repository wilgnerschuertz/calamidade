import 'package:coopartilhar/app/features/address/entities/address_entity.dart';

class AddressAdapter {
  static AddressEntity fromJson(Map<String, dynamic> json) {
    return AddressEntity(
      json['id'],
      addressName: json['addressName'],
      street: json['street'],
      complement: json['complement'],
      number: json['number'],
      city: json['city'],
      uf: json['uf'],
      cep: json['cep'],
      locationLatitude: json['locationLatitude'],
      locationLongitude: json['locationLongitude'],
    );
  }

  static Map<String, dynamic> toJson(AddressEntity address) {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['addressName'] = address.addressName;
    data['street'] = address.street;
    data['complement'] = address.complement;
    data['number'] = address.number;
    data['city'] = address.city;
    data['uf'] = address.uf;
    data['cep'] = address.cep;
    data['locationLatitude'] = address.locationLatitude;
    data['locationLongitude'] = address.locationLongitude;
    return data;
  }
}
