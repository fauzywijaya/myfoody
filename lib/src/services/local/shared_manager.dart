import 'package:shared_preferences/shared_preferences.dart';

class SharedManager<T> {
  late SharedPreferences _prefs;

  // ignore: avoid_shadowing_type_parameters
  Type type<T>() => T;

  /// Call the shared preferences
  /// field using keyname and with
  /// the generic return type
  Future<T?> read(String key) async {
    _prefs = await SharedPreferences.getInstance();
    if (_prefs.containsKey(key)) {
      return _prefs.get(key) as T;
    }
    return null;
  }

  Future story(String key, dynamic value) async {
    _prefs = await SharedPreferences.getInstance();
    var types = type<T>();
    switch (types) {
      case String:
        _prefs.setString(key, value);
        break;
      case int:
        _prefs.setInt(key, value);
        break;
      case double:
        _prefs.setDouble(key, value);
        break;
      case bool:
        _prefs.setBool(key, value);
        break;
      case List:
        _prefs.setStringList(key, value);
        break;
    }
  }

  Future clear() async {
    _prefs = await SharedPreferences.getInstance();
    _prefs.clear();
  }
}
