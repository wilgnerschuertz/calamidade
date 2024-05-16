import 'package:coopartilhar/app/features/home/interactor/cooperated_entity.dart';

class CooperatedAdapter {
  static CooperatedEntity fromJson(Map<String, dynamic> json) =>
      CooperatedEntity(
        id: json['id'],
        name: json['name'],
      );
}
