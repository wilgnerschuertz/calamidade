import 'package:coopartilhar/app/features/helps/interactor/entities/helps_entity.dart';
import 'package:core_module/core_module.dart';

abstract class IHelpsRepository {
  Future<Output<HelpsEntity>> fetchData();
}