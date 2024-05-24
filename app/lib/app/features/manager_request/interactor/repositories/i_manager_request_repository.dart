import 'package:coopartilhar/app/features/manager_request/interactor/entities/request_list_entity.dart';
import 'package:core_module/core_module.dart';

abstract class IManagerRequestRepository {
  Future<Output<RequestListEntity>> getRequests();
}
