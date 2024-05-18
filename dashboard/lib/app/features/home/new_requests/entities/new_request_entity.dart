import 'package:core_module/core_module.dart';

enum StatusNewRequest { alta, media, baixa }

class NewRequestEntity extends Entity {
  final String name;
  final StatusNewRequest status;
  final String city;
  final String phone;
  final String bank;
  final String agency;
  final String account;
  final String urlImage;
  final String description;

  NewRequestEntity(
    super.id, {
    required this.name,
    required this.status,
    required this.city,
    required this.phone,
    required this.bank,
    required this.agency,
    required this.account,
    required this.urlImage,
    required this.description,
  });
}
