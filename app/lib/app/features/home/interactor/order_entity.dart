import 'package:coopartilhar/app/features/home/data/cooperated_entity.dart';

class OrderEntity {
  final String id;
  final String tag;
  final String title;
  final String helpType;
  final String address;
  final int amount;
  final String status;
  final String obs;
  final String telephone;
  final CooperatedEntity? cooperated;
  final dynamic godfather;
  final String createdAt;
  final String chavePix;
  final String banco;
  final String agencia;
  final String conta;

  OrderEntity(
      {required this.id,
      required this.tag,
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
      required this.conta});
}
