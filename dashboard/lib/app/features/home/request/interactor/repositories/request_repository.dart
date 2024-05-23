import 'package:core_module/core_module.dart';

abstract interface class RequestRepository {
  Future<Output<List<RequestEntity>>> getRequests();
}
