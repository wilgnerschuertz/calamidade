import 'package:core_module/core_module.dart';
import 'package:core_module/src/cache/shared_preferences_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  SharedPreferences.setMockInitialValues({});

  test('shared preferences impl String ...', () async {
    SharedPreferencesImpl chace = SharedPreferencesImpl();

    CacheParams params = CacheParams(key: 'String', value: 'teste');

    await chace.setData(params: params);

    final teste = await chace.getData('String');

    expect(teste, 'teste');
  });

  test('shared preferences impl bool ...', () async {
    SharedPreferencesImpl chace = SharedPreferencesImpl();

    CacheParams params = CacheParams(key: 'bool', value: true);

    await chace.setData(params: params);

    final teste = await chace.getData('bool');

    expect(teste, true);
  });

  test('shared preferences impl List...', () async {
    SharedPreferencesImpl chace = SharedPreferencesImpl();

    CacheParams params = CacheParams(key: 'list', value: ['teste']);

    await chace.setData(params: params);

    final teste = await chace.getData('list');

    expect(teste, ['teste']);
  });

  test('shared preferences impl Remove...', () async {
    SharedPreferencesImpl chace = SharedPreferencesImpl();

    CacheParams params = CacheParams(key: 'remove', value: 'teste');

    await chace.setData(params: params);

    final teste = await chace.getData('remove');

    expect(teste, 'teste');

    await chace.removeData('remove');

    expect(() => chace.getData('remove'), throwsA(isA<CacheException>()));
  });
}
