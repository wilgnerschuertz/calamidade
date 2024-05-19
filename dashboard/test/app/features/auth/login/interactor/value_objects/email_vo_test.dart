import 'package:dashboard/app/features/auth/login/interactor/value_objects/email_vo.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Deve retornar null - Sucesso', () {
    final EmailVO email = EmailVO(value: 'email@gmail.com');
    expect(email.validate(), null);
  });

  test(
      'Deve retornar uma string informando que o email não pode ser vazio - Erro',
      () {
    final EmailVO email = EmailVO(value: '');
    expect(email.validate(), isA<String>());
    expect(email.validate(), 'O email não pode ser vazio.');
  });

  test('Deve retornar uma string informando que o email não é válido - Erro',
      () {
    final EmailVO wrongEmail1 = EmailVO(value: '@email.com');
    expect(wrongEmail1.validate(), isA<String>());
    expect(wrongEmail1.validate(), 'O email não é válido.');

    final EmailVO wrongEmail2 = EmailVO(value: 'email@');
    expect(wrongEmail2.validate(), isA<String>());
    expect(wrongEmail2.validate(), 'O email não é válido.');

    final EmailVO wrongEmail3 = EmailVO(value: 'email');
    expect(wrongEmail3.validate(), isA<String>());
    expect(wrongEmail3.validate(), 'O email não é válido.');
  });
}
