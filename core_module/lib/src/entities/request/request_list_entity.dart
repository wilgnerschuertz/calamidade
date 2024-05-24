import 'package:core_module/core_module.dart';

class RequestListEntity extends Entity {
  final List<RequestEntity> requests;
  final bool hasNextPage;

  RequestListEntity({required this.requests, required this.hasNextPage})
      : super(-1);
}
