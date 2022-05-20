import '../view/onboarding_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SimplePreferences {
  static SharedPreferences _prefs = SharedPreferences.getInstance() as SharedPreferences;

  static Future init() async =>
      _prefs = await SharedPreferences.getInstance();

  static Future storeOnboardInfo() async {
    print("Shared pref called");
    int viewed = 0;
    await _prefs.setInt('onBoard', viewed);
  }
  static getViewed() => _prefs.getInt('onBoard');

}