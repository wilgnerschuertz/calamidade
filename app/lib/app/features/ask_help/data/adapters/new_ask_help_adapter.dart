import 'package:coopartilhar/app/features/ask_help/entities/solicitation_entity.dart';
import 'package:core_module/src/entities/auth/user_entity.dart';

class NewAskHelpAdapter {
  static Map<String, dynamic> toJson(
      SolicitationEntity solicitationEntity, UserEntity user) {
    return {
      'title': solicitationEntity.title,
      'description': solicitationEntity.description,
      'amount': solicitationEntity.value,
      'financialPixkey': solicitationEntity.pix,
      'financialBank': solicitationEntity.bank,
      'financialAgency': solicitationEntity.agency,
      'financialAccount': solicitationEntity.account,
      'status': {
        'id': 1,
        'name': 'financial',
      },
      'helpType': {'id': 1, 'name': 'Analysis'},
      'godFather': user.id,
    };
  }
}
