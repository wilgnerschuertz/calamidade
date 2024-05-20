import 'package:core_module/core_module.dart';
import 'package:core_module/src/cache/shared_preferences_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  SharedPreferences.setMockInitialValues({});

  test('shared preferences impl String ...', () async {
    SharedPreferencesImpl cache = SharedPreferencesImpl();

    CacheParams params = CacheParams(key: 'String', value: 'teste');

    await cache.setData(params: params);

    final teste = await cache.getData('String');

    expect(teste, 'teste');
  });

  test('shared preferences impl bool ...', () async {
    SharedPreferencesImpl cache = SharedPreferencesImpl();

    CacheParams params = CacheParams(key: 'bool', value: true);

    await cache.setData(params: params);

    final teste = await cache.getData('bool');

    expect(teste, true);
  });

  test('shared preferences impl List...', () async {
    SharedPreferencesImpl cache = SharedPreferencesImpl();

    CacheParams params = CacheParams(key: 'list', value: ['teste']);

    await cache.setData(params: params);

    final teste = await cache.getData('list');

    expect(teste, ['teste']);
  });

  test('shared preferences impl Remove...', () async {
    SharedPreferencesImpl cache = SharedPreferencesImpl();

    CacheParams params = CacheParams(key: 'remove', value: 'teste');

    await cache.setData(params: params);

    final teste = await cache.getData('remove');

    expect(teste, 'teste');

    await cache.removeData('remove');

    expect(cache.getData('remove'), completion(isNull));
  });
}
