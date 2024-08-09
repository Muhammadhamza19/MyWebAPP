import 'package:local_grocery/support/config/app_constant.dart';
import "package:dio/dio.dart";
import "package:flutter_secure_storage/flutter_secure_storage.dart";

class ApiInterceptors extends Interceptor {
  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    final FlutterSecureStorage secureStorage = const FlutterSecureStorage();

    var token = await secureStorage.read(key: SESSION_TOKEN);
    options.headers["Authorization"] = "Bearer " + (token ?? "");

    print('REQUEST[${options.method}] => PATH: ${options.path}');
    print('REQUEST_[token ${"Bearer " + (token ?? "")}]');
    super.onRequest(options, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    print(
      'ERROR[${err.response?.statusMessage}] => PATH: ${err.requestOptions.path}',
    );
    super.onError(err, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    print(
      'RESPONSE[${response.statusCode}] => PATH: ${response.requestOptions.path}',
    );
    super.onResponse(response, handler);
  }
}
