import 'package:coopartilhar/app/features/check_affiliated/entities/check_affiliated_entity.dart';

class CheckAffiliatedAdapter {
  static CheckAffiliatedEntity fromJson(Map<String, dynamic> json) {
    // TODO, check backend variables name
    return CheckAffiliatedEntity(
      json['id'],
      isAffiliated: json['isAffiliated'],
    );
  }
}
