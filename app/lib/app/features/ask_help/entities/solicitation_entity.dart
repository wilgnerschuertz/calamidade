import 'package:coopartilhar/app/features/ask_help/entities/solicitation_help_type_entity.dart';
import 'package:coopartilhar/app/features/ask_help/entities/solicitation_status_entity.dart';
import 'package:core_module/core_module.dart';

class SolicitationEntity extends Entity {
  final String title;
  final String cpf;
  final String? pix;
  final String? bank;
  final String? agency;
  final String? account;
  final double value;
  final String? description;
  final SolicitationStatusEntity status;
  final SolicitationHelpTypeEntity helpType;

  SolicitationEntity({
    int? id,
    required this.title,
    required this.cpf,
    this.pix,
    this.bank,
    this.agency,
    this.account,
    required this.value,
    this.description,
    required this.status,
    required this.helpType,
  }) : super(id);
}
