import 'package:coopartilhar/app/features/helps/interactor/entities/helps_entity.dart';
import 'package:core_module/core_module.dart';

class HelpsAdapter {

  static HelpsEntity fromJson(Map<String, dynamic> data) {
    return HelpsEntity(
      data['id'] ?? const Uuid(),
      name: data['name'] ?? '',
    );
  }

  static Map<String, dynamic> toJson(HelpsEntity entity) {  
    return {
      'name': entity.name,     
    };
  }
}
