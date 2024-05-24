import 'package:coopartilhar/app/features/manager_request/interactor/entities/request_list_entity.dart';
import 'package:core_module/core_module.dart';

class RequestListAdapter {
  static RequestListEntity fromJson(Map<String, dynamic> json) {
    return RequestListEntity(
      forMe: (json['forMe']['data'] as List).isNotEmpty
          ? (json['forMe']['data'] as List).map((entity) {
              return RequestAdapter.fromJson(entity);
            }).toList()
          : [],
      forOthers: (json['forOthers']['data'] as List).isNotEmpty
          ? (json['forOthers']['data'] as List).map((entity) {
              return RequestAdapter.fromJson(entity);
            }).toList()
          : [],
      hasNextPage:
          json['forMe']['hasNextPage'] || json['forOthers']['hasNextPage'],
    );
  }
}
