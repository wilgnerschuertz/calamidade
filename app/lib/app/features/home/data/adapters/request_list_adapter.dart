import 'package:coopartilhar/app/features/home/interactor/entities/request_list_entity.dart';
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
