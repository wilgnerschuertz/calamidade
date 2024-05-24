import 'package:core_module/core_module.dart';

class RequestListAdapter {
  static RequestListEntity fromJson(Map<String, dynamic> json) {
    return RequestListEntity(
      requests: (json['data'] as List).map((entity) {
        return RequestAdapter.fromJson(entity);
      }).toList(),
      hasNextPage: json['hasNextPage'],
    );
  }
}
