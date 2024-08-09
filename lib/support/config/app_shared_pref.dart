import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppSharedPref {
  /// PREF
  static const String PREF_USER_ID = "PREF_USER_ID";

  static Future<bool> initSessionManager() async {
    var _prefs = await SharedPreferences.getInstance();
    Get.put(_prefs);
    return true;
  }

  /// Set user id
  static setUserId(int employeeeId) {
    SharedPreferences _pref = Get.find();
    _pref.setInt(PREF_USER_ID, employeeeId);
  }

  /// Get user id
  static int getUserId() {
    SharedPreferences _pref = Get.find();
    return _pref.getInt(PREF_USER_ID) ?? 0;
  }
}
