import 'package:coopartilhar/app/features/request_details/data/adapters/request_help_type_adapter.dart';
import 'package:coopartilhar/app/features/request_details/data/adapters/request_status_adapter.dart';
import 'package:core_module/core_module.dart';

import 'god_father_adapter.dart';

class RequestAdapter {
  static RequestEntity fromJson(Map<String, dynamic> map) {
    return RequestEntity(
      id: map['id'] ?? -1,
      title: map['title'] ?? '',
      description: map['description'] ?? '',
      amount: map['amount'] ?? '',
      createdAt: DateTime.parse(map['createdAt']),
      financialPixkey: map['financialPixkey'] ?? '',
      financialBank: map['financialBank'] ?? '',
      financialAgency: map['financialBank'] ?? '',
      financialAccount: map['financialAccount'] ?? '',
      status: RequestStatusAdapter.fromJson(map['status']),
      helpType: RequestHelpTypeAdapter.fromJson(map['helpType']),
      user: UserAdapter.fromJson(map['user']),
      godFather: GodFatherAdapter.fromJson(map['godFather']),
    );
  }
}
