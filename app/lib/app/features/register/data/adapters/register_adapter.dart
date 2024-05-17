import 'package:coopartilhar/app/features/register/entities/register_entity.dart';

class RegisterAdapter {
  static Map<String, dynamic> toJson(RegisterEntity register) {
    final [firstName, lastName] = register.name.split(' ');

    return {
      "email": register.email,
      "password": register.password,
      "firstName": firstName,
      "lastName": lastName,
    };
  }
}
