import 'package:dashboard/app/features/auth/login/data/adapters/credentials_adapter.dart';
import 'package:dashboard/app/features/auth/login/interactor/entities/credentials_entity.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('credentials adapter ...', () {
    final credentialsMap = CredentialsAdapter.toMap(
        CredentialsEntity(0, 'email@email.com.br', 'vinte@#trinta'));
    expect(credentialsMap, isA<Map<String, dynamic>>());
  });
}
