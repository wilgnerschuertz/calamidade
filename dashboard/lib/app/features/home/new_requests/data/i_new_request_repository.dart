import 'package:core_module/core_module.dart';
import 'package:dashboard/app/features/home/new_requests/interactor/entities/new_request_entity.dart';

abstract interface class INewRequestRepository {
  Future<Output<List<NewRequestEntity>>> getNewRequest();
}
