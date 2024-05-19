import 'package:coopartilhar/app/features/request_details/entities/user_request_details_entity.dart';

abstract class UserRequestDetailsAdapter {
  static UserRequestDetailsEntity fromJson(Map<String, dynamic> map) {
    final addresses = map['addresses'];
    return UserRequestDetailsEntity(
      id: map['id'],
      phone: map['telephone'],
      name: '${map['firstName'] ?? ''} ${map['last'] ?? ''}',
      address: _formatFirstAddress(addresses),
    );
  }
}

String _formatFirstAddress(List<dynamic> addresses) {
  if (addresses.isEmpty) {
    return 'Não informado';
  }
  final city = addresses.first['city'];
  final street = addresses.first['street'];
  return '$city - $street';
}
