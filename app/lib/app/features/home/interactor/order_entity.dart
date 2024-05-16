import 'package:coopartilhar/app/features/home/interactor/cooperated_entity.dart';
import 'package:core_module/core_module.dart';

class OrderEntity extends Entity {
  final String tag, title, helpType, address;
  final String status, obs, telephone;
  final String createdAt, chavePix, banco, agencia, conta;
  final int amount;
  final CooperatedEntity? cooperated;
  final dynamic godfather;

  OrderEntity(
      {required this.tag,
      required this.title,
      required this.helpType,
      required this.address,
      required this.amount,
      required this.status,
      required this.obs,
      required this.telephone,
      this.cooperated,
      this.godfather,
      required this.createdAt,
      required this.chavePix,
      required this.banco,
      required this.agencia,
      required this.conta,
      required String id})
      : super(id);
}
