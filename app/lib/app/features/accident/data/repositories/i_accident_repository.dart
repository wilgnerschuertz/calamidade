import 'package:coopartilhar/app/features/accident/entities/accident_entity.dart';
import 'package:core_module/core_module.dart';

abstract class IAccidentRepository {
  Future<Output<void>> saveAccident(AccidentEntity accident);
}
