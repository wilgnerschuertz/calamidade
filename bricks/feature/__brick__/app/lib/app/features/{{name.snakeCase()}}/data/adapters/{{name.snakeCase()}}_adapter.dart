import 'package:coopartilhar/app/features/{{name.snakeCase()}}/interactor/entities/{{name.snakeCase()}}_entity.dart';
import 'package:core_module/core_module.dart';

class {{name.pascalCase()}}Adapter {

  static {{name.pascalCase()}}Entity fromJson(Map<String, dynamic> data) {
    return {{name.pascalCase()}}Entity(
      data['id'] ?? const Uuid(),
      name: data['name'] ?? '',
    );
  }

  static Map<String, dynamic> toJson({{name.pascalCase()}}Entity entity) {  
    return {
      'name': entity.name,     
    };
  }
}
