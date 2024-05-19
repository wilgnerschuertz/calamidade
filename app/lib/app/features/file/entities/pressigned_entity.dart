import 'package:core_module/core_module.dart';

class PressignedEntity extends Entity {
  final String url;
  final String key;
  final String fileId;

  PressignedEntity(super.id,
      {required this.url, required this.key, required this.fileId});
}
