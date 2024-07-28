import 'package:shared_preferences/shared_preferences.dart';

class AppLocalStorage {
  static setHasBeenOnboarded(bool value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('hasOnboarded', value);
  }

  static Future<bool> getHasBeenOnboarded() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? hasOnboarded = await prefs.getBool('hasOnboarded');
    return hasOnboarded ?? false;
  }
}
