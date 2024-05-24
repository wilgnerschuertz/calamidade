import 'package:core_module/core_module.dart';

class RequestManagerListEntity extends Entity {
  final List<RequestEntity> forMe;
  final List<RequestEntity> forOthers;
  final bool hasNextPage;

  RequestManagerListEntity(
      {required this.forMe, required this.forOthers, required this.hasNextPage})
      : super(0);
}
