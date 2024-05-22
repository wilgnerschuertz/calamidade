import '../auth/user_entity.dart';
import '../entity.dart';
import 'god_father.dart';
import 'request_help_type.dart';
import 'request_status_entity.dart';

class RequestEntity extends Entity {
  final String title;
  final String description;
  final double amount;
  final String financialPixkey;
  final String financialBank;
  final String financialAgency;
  final String financialAccount;
  final DateTime createdAt;
  final UserEntity user;
  final RequestStatusEntity status;
  final RequestHelpType helpType;
  final GodFather godFather;

  RequestEntity({
    required int id,
    required this.title,
    required this.description,
    required this.amount,
    required this.createdAt,
    required this.financialPixkey,
    required this.financialBank,
    required this.financialAgency,
    required this.financialAccount,
    required this.status,
    required this.helpType,
    required this.user,
    required this.godFather,
  }) : super(id);
}
