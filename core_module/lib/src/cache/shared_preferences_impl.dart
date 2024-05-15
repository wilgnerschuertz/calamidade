import 'package:core_module/core_module.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesImpl implements ICache {
  @override
  Future<dynamic> getData(String key) async {
    final prefs = await SharedPreferences.getInstance();
    final result = prefs.get(key);

    if (result != null) {
      return result;
    } else {
      throw CacheException(
          message: 'There is no key ($key) passed as a parameter');
    }
  }

  @override
  Future<bool> setData({required CacheParams params}) async {
    final prefs = await SharedPreferences.getInstance();
    switch (params.value.runtimeType.toString()) {
      case 'String':
        return await prefs.setString(params.key, params.value);
      case 'int':
        return await prefs.setInt(params.key, params.value);
      case 'bool':
        return await prefs.setBool(params.key, params.value);
      case 'double':
        return await prefs.setDouble(params.key, params.value);
      case 'List<String>':
        return await prefs.setStringList(params.key, params.value);
    }
    return false;
  }

  @override
  Future<bool> removeData(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return await prefs.remove(key);
  }
}
