import 'package:core_module/core_module.dart';

enum StatusNewRequest {
  // TODO: Adicionar os status corretos e corrigir as cores para cada status
  // no momento ainda não foram decididos quais serão os status
  low(label: 'Baixa'),
  medium(label: 'Média'),
  high(label: 'Alta'),
  notDefined(label: 'Não definido');

  final String label;

  const StatusNewRequest({required this.label});

  static StatusNewRequest fromId(int id) {
    switch (id) {
      case 1:
        return StatusNewRequest.low;
      case 2:
        return StatusNewRequest.medium;
      case 3:
        return StatusNewRequest.high;
      default:
        return StatusNewRequest.notDefined;
    }
  }
}

class NewRequestEntity extends Entity {
  final String titleDescription;
  final String name;
  final String city;
  final String phone;
  final String date;
  final StatusNewRequest status;
  final String requestedIncome;
  final String bank;
  final String agency;
  final String account;
  final String urlImage;
  final String description;

  NewRequestEntity(
    super.id, {
    required this.titleDescription,
    required this.name,
    required this.city,
    required this.phone,
    required this.date,
    required this.status,
    required this.requestedIncome,
    required this.bank,
    required this.agency,
    required this.account,
    required this.urlImage,
    required this.description,
  });
}
