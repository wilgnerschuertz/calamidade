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
      status: map['status'],
      helpType: map['helpType'],
      user: UserAdapter.fromJson(map['user']),
      godFather: map['godFather'] != null
          ? GodFatherAdapter.fromJson(map['godFather'])
          : null,
    );
  }

  static Map<String, dynamic> toJson(
      {required RequestEntity request, required int godFatherId}) {
    return {
      'title': request.title,
      'description': request.description,
      'amount': request.amount,
      'financialPixkey': request.financialPixkey,
      'financialBank': request.financialBank,
      'financialAgency': request.financialAgency,
      'financialAccount': request.financialAccount,
      'godFather': godFatherId
    };
  }
}
