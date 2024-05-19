import 'package:dashboard/app/features/auth/login/interactor/value_objects/password_vo.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Deve retornar null - Sucesso', () {
    final PasswordVO password = PasswordVO(value: 'vinte@#trinta');
    expect(password.validate(), null);
  });

  test(
      'Deve retornar uma string informando que a senha não pode ser vazia. - Erro',
      () {
    final PasswordVO password = PasswordVO(value: '');
    expect(password.validate(), isA<String>());
    expect(password.validate(), 'A senha não pode ser vazia.');
  });

  test(
      'Deve retornar uma string informando que a senha deve ter pelo menos 4 caracteres. - Erro',
      () {
    final PasswordVO password = PasswordVO(value: '123');
    expect(password.validate(), isA<String>());
    expect(
        password.validate(), 'Insira uma senha com pelo menos 4 caracteres.');
  });
}
