import 'package:core_module/core_module.dart';

class RequestStatusAdapter {
  static RequestStatusEntity fromJson(Map<String, dynamic> map) {
    return RequestStatusEntity.fromId(map['id'] ?? 5);
  }
}
