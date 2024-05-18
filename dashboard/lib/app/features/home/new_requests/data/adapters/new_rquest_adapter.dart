import 'package:dashboard/app/features/home/new_requests/entities/new_request_entity.dart';

class NewRequestAdapter {
  static NewRequestEntity fromJson(Map json) {
    return NewRequestEntity(
      json['id'].toString(),
      titleDescription: json['description'],
      date: json['date'],
      requestedIncome: json['requestedIncome'],
      name: json['name'],
      status: StatusNewRequest.status(json['status']),
      city: json['city'],
      phone: json['phone'],
      bank: json['bank'],
      agency: json['agency'],
      account: json['account'],
      urlImage: json['urlImage'],
      description: json['description'],
    );
  }
}
