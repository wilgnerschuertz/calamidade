import 'package:core_module/core_module.dart';

class {{name.pascalCase()}}Entity extends Entity {
  final String name;

  {{name.pascalCase()}}Entity(
    super.id, {
    required this.name,   
  });
}
