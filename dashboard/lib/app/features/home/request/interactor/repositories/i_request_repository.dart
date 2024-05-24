import 'package:core_module/core_module.dart';

abstract interface class IRequestRepository {
  Future<Output<RequestListEntity>> getRequests();
}
