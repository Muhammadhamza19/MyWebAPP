import "dart:io";

import "package:local_grocery/providers/dio/api_interceptor.dart";
import "package:dio/dio.dart";
import "package:flutter_secure_storage/flutter_secure_storage.dart";

class DioClient {
  static final DioClient _singleton = DioClient._internal();
  static final String SERVER_URL = "https://api.local_grocery.pk/api";
  final FlutterSecureStorage secureStorage = const FlutterSecureStorage();
  factory DioClient() {
    return _singleton;
  }

  DioClient._internal();

  final Dio dio = Dio(
    BaseOptions(
        baseUrl: SERVER_URL,
        connectTimeout: Duration(seconds: 60),
        receiveTimeout: Duration(seconds: 120),
        headers: {"Content-Type": "application/json"}),
  )..interceptors.add(ApiInterceptors());
}
