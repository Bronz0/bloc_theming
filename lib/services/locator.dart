import 'package:bloc_theming/services/theme_service.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

GetIt locator = GetIt.I;
SharedPreferences sharedPreferences;

//static final locator = GetIt.instance;
Future<void> setUpServices() async {
  sharedPreferences = await SharedPreferences.getInstance();
  // theme Service
  locator.registerSingleton<ThemeServie>(ThemeServie(), signalsReady: true);
  // shared preferences
  //locator.registerSingleton<SharedPreferences>(prefs);

  // http client
  locator.registerSingleton<http.Client>(http.Client());
}
