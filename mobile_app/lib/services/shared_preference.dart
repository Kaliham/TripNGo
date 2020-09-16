import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHelper {
  final String _kLoginPrefs = "Login";
  final String _kIdPrefs = "ID";

  Future<String> getLogin() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.getString(_kLoginPrefs);
  }

  Future<bool> setLogin(String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(_kLoginPrefs, value);
  }

  Future<int> getID() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.getInt(_kIdPrefs);
  }

  Future<bool> setId(int value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setInt(_kIdPrefs, value);
  }
}
