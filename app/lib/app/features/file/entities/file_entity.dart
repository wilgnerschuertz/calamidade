import 'package:core_module/core_module.dart';

class FileEntity extends Entity {
  final String path;
  final String name;
  
  FileEntity(super.id, this.path, this.name);
}