import 'package:dokan/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefUtil {
  static prefInit() async {
    prefs = await SharedPreferences.getInstance();
  }

  static String getToken() {
    return prefs?.getString("token") ?? "";
  }

  static storeToken(String token) {
    return prefs?.setString("token", token);
  }
}
