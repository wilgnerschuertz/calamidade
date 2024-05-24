import 'package:core_module/core_module.dart';

class RequestListEntity extends Entity {
  final List<RequestEntity> forMe;
  final List<RequestEntity> forOthers;
  final bool hasNextPage;

  RequestListEntity(
      {required this.forMe, required this.forOthers, required this.hasNextPage})
      : super(0);
}
