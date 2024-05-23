import 'package:core_module/core_module.dart';

class RequestHelpTypeAdapter {
  static RequestHelpType fromJson(Map<String, dynamic> map) {
    return RequestHelpType(
      id: map['id'],
      name: map['name'] ?? '',
    );
  }
}
