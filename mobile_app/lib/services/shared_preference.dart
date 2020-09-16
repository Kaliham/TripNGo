import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHelper {
  final String _kLoginPrefs = "Login";

  Future<String> getLogin() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.getString(_kLoginPrefs);
  }

  /// ----------------------------------------------------------
  /// Method that saves the user decision to allow notifications
  /// ----------------------------------------------------------
  Future<bool> setLogin(String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(_kLoginPrefs, value);
  }
}
