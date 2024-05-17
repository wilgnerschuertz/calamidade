import 'package:coopartilhar/app/features/ask_help/entities/solicitation_entity.dart';
import 'package:core_module/core_module.dart';

abstract class IAskHelpRepository {
  Future<Output<void>> saveSolicitation(SolicitationEntity solicitationEntity);
}
