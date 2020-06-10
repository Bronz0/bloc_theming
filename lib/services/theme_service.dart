import 'package:bloc_theming/services/locator.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeServie {
  void persistTheme(theme) async {
    sharedPreferences.setString("current_theme", theme);
  }

  String retreiveTheme() {
    SharedPreferences _prefs = sharedPreferences;
    return _prefs.getString("current_theme");
  }
}
