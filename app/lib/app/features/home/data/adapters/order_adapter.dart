import 'package:coopartilhar/app/features/home/data/adapters/god_father_entity_adapter.dart';
import 'package:coopartilhar/app/features/home/interactor/entities/order_entity.dart';

abstract class OrderAdapter {
  static OrderEntity fromJson(Map<String, dynamic> json) => OrderEntity(
        json['id'] ?? -1,
        title: json['title'],
        description: json['description'],
        amount: json['amount'],
        statusId: json['statusId'],
        financialPixkey: json['financialPixkey'],
        financialBank: json['financialBank'],
        financialAgency: json['financialAgency'],
        financialAccount: json['financialAccount'],
        createdAt: DateTime.parse(json['createdAt']),
        updatedAt: DateTime.parse(json['updatedAt']),
        deletedAt: json['deletedAt'] == null ? null : DateTime.parse(json['deletedAt']),
        owner: null,
        godfather: GodFatherAdapter.fromJson(json['godFather']),
      );
}
