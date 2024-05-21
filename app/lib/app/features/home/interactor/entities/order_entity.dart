import 'package:coopartilhar/app/features/home/interactor/entities/god_father_entity.dart';
import 'package:coopartilhar/app/features/home/interactor/entities/order_owner_entity.dart';
import 'package:core_module/core_module.dart';

class OrderEntity extends Entity {
  final int id;
  final String title;
  final String description;
  final double amount;
  final int statusId;
  final String financialPixkey;
  final String financialBank;
  final String financialAgency;
  final String financialAccount;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? deletedAt;
  final OrderOwnerEntity? owner;
  final GodFatherEntity? godfather;

  OrderEntity(
    this.id, {
    required this.title,
    required this.description,
    required this.amount,
    required this.statusId,
    required this.financialPixkey,
    required this.financialBank,
    required this.financialAgency,
    required this.financialAccount,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
    required this.owner,
    required this.godfather,
  }) : super(id);
}
