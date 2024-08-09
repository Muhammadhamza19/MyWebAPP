import 'dart:convert';

import 'package:local_grocery/providers/request/generic_request.dart';
import 'package:local_grocery/support/config/app_constant.dart';
import 'package:local_grocery/support/config/app_strings.dart';
import 'package:connectivity/connectivity.dart';
import 'package:local_grocery/support/config/app_theme.dart';
import 'package:crypto/crypto.dart';

class AppUtils {
  Future<bool> isConnectedToNetwork() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
      return true;
    } else if (connectivityResult == ConnectivityResult.wifi) {
      return true;
    }

    showErrorMessage("Connection not found");
    return false;
  }

  bool isValidEmail(String email) {
    // Define the regular expression for validating an email
    final RegExp emailRegex =
        RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{1,}$");

    // Check if the email matches the regex
    return emailRegex.hasMatch(email);
  }

  static Future<GenericRequest> getGenericRequest(
      GenericRequest request) async {
    request.userEmpIndex = await AppUtils.getUserEmpIndex();
    request.userProxyIndex = await AppUtils.getUserProxyIndex();
    request.languageCode = "";
    // request.deviceID = ""; //(await PlatformDeviceId.getDeviceId)!;
    // request.deviceType = ""; //(await deviceType());
    // request.fcmToken = ""; //(await getPrefs(PREF_KEY_FCM));
    // request.apnsToken = '';
    request.signature = ""; //(await generateSignature(request));

    return request;
  }

  static Future<String> generateSignature(GenericRequest request) async {
    String sequence1 = request.languageCode ?? "";
    String sequence2 = request.parameter_1! +
        request.parameter_2! +
        request.parameter_3! +
        request.parameter_4! +
        request.parameter_5! +
        request.parameter_6! +
        request.parameter_7! +
        request.parameter_8! +
        request.parameter_9! +
        request.parameter_10! +
        request.parameter_11! +
        request.parameter_12! +
        request.parameter_13! +
        request.parameter_14! +
        request.parameter_15! +
        request.parameter_16! +
        request.parameter_17! +
        request.parameter_18!;

    String sequence3 = sequence1 + sequence2 + APP_SALT;

    return md5.convert(utf8.encode(sequence3)).toString();
  }

  static Future<String> getClientIndex() async {
    return "";
  }

  static Future<String> getBUIndex() async {
    return "";
  }

  static Future<String> getUserEmpIndex() async {
    return "0";
  }

  static Future<String> getUserProxyIndex() async {
    return "0";
  }
}
