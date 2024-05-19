import 'package:coopartilhar/app/features/request_details/data/adapters/user_request_details_adapter.dart';
import 'package:coopartilhar/app/features/request_details/entities/request_details_entity.dart';

class RequestDetailsAdapter {
  static RequestDetailsEntity fromJson(Map<String, dynamic> map) {
    return RequestDetailsEntity(
      id: map['id'],
      user: UserRequestDetailsAdapter.fromJson(map['user']),
      title: map['title'],
      amount: map['amount'],
      status: Status.fromId(map['status']),
      createdAt: DateTime.parse(map['createdAt']),
      description: map['description'],
    );
  }
}
