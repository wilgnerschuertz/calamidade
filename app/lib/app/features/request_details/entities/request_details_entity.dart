import 'package:coopartilhar/app/features/request_details/entities/user_request_details_entity.dart';
import 'package:core_module/core_module.dart';

class RequestDetailsEntity extends Entity {
  final String title;
  final UserRequestDetailsEntity user;
  final DateTime createdAt;
  final double amount;
  final Status status;
  final String description;

  RequestDetailsEntity({
    required int id,
    required this.title,
    required this.user,
    required this.createdAt,
    required this.amount,
    required this.status,
    required this.description,
  }) : super(id);
}

enum Status {
  analisys('Em analise', 0xFFfcb900, 0xFFa17703),
  accepted('Aceito', 0xFF129166, 0xFF0a4531),
  rejected('Rejeitado', 0xFFEB5757, 0xFF7d2e2e),
  concluded('Concluído', 0xFF129166, 0xFF0a4531),
  notDefined('Não definido', 0xFF010101, 0xFFFFFFFF);

  final String label;
  final int color;
  final int foregroundColor;

  const Status(this.label, this.color, this.foregroundColor);

  static Status fromId(int id) {
    switch (id) {
      case 1:
        return Status.analisys;
      case 2:
        return Status.accepted;
      case 3:
        return Status.rejected;
      case 4:
        return Status.concluded;
      default:
        return Status.notDefined;
    }
  }
}
