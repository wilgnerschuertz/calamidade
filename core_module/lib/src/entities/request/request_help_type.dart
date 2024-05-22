import 'package:core_module/src/entities/entity.dart';

class RequestHelpType extends Entity {
  final int id;
  final String name;

  RequestHelpType({required this.id, required this.name}) : super(id);
}
