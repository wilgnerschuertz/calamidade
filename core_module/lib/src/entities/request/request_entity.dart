import '../auth/user_entity.dart';
import '../entity.dart';
import 'god_father.dart';

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
  final String status;
  final String helpType;
  final GodFather? godFather;

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
    this.godFather,
  }) : super(id);
}
