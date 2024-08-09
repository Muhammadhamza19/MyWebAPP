import 'dart:convert';

import 'package:local_grocery/models/login_response_main.dart';
import 'package:local_grocery/providers/dio/dio_client.dart';
import 'package:local_grocery/providers/request/generic_request.dart';
import 'package:local_grocery/support/config/app_utils.dart';
import 'package:local_grocery/providers/base_provider.dart';
import 'package:local_grocery/support/config/app_theme.dart';
import 'package:dio/dio.dart';

class UserServiceProvider extends BaseProvider {
  Future<dynamic?> loginService({
    required GenericRequest genericRequest,
  }) async {
    Response response = await DioClient().dio.post(
          '/Login/Login',
          data: jsonEncode(
            await AppUtils.getGenericRequest(genericRequest),
          ),
        );

    final loginResponseMain = LoginResponseMain.parseFromJson(
      response.data,
    );

    if (loginResponseMain.header.code != 0)
      showErrorMessage(loginResponseMain.header.message ?? "");

    return loginResponseMain;
  }
}
