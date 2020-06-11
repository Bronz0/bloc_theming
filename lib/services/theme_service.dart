import 'package:bloc_theming/data/theme/theme_repo.dart';
import 'package:bloc_theming/services/locator.dart';

class ThemeServie implements ThemeRepo {
  void persistTheme(theme) async {
    sharedPreferences.setString("current_theme", theme);
  }

  String retreiveTheme() {
    return sharedPreferences.getString("current_theme") ?? "no theme found!";
  }
}
