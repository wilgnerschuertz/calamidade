import 'package:core_module/core_module.dart';

class RequestUserAdapter {
  static UserEntity fromJson(Map<String, dynamic> data) {
    final name = '${data['firstName']} ${data['lastName']}';
    return UserEntity(
      data['id'] ?? -1,
      name: name,
      email: data['email'] ?? '',
      phone: data['phono'] ?? '',
      document: data['document'] ?? '',
    );
  }
}
