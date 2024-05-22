import 'package:core_module/core_module.dart';

abstract class IRequestDetailsRepository {
  Future<Output<RequestEntity>> getRequestById(String id);
}
