import 'package:shared_preferences/shared_preferences.dart';

class CacheClient {
  Future<bool> delete(String key) async {
    final prefs = await SharedPreferences.getInstance();
    var result = await prefs.remove(key);
    return result;
  }

  Future<bool> deleteAll() async {
    final prefs = await SharedPreferences.getInstance();
    var result = await prefs.clear();
    return result;
  }

  Future<dynamic> get(String key) async {
    final prefs = await SharedPreferences.getInstance();
    final value = prefs.get(key);
    return value;
  }

  Future<bool> set(String key, dynamic value) async {
    if (value is String?) {
      if (value == null) {
        return false;
      }
      final prefs = await SharedPreferences.getInstance();
      final result = await prefs.setString(key, value);
      return result;
    } else {
      throw Exception(['Value isn\'t of type String?']);
    }
  }
}