import 'dart:io';

import 'package:dio/dio.dart';

class DioClient {
  late String _baseUrl;

  DioClient() {
    _baseUrl =
        'https://api-quickqueue-9d311ca15f87.herokuapp.com/api/';
  }

  Dio defaultDio() {
    return Dio(
      BaseOptions(
        baseUrl: _baseUrl,
        contentType: Headers.jsonContentType,
        responseType: ResponseType.json,
        connectTimeout: const Duration(seconds: 30),
      ),
    );
  }

  Dio authorizedDio(String token) {
    return Dio(
      BaseOptions(
        baseUrl: _baseUrl,
        contentType: Headers.jsonContentType,
        responseType: ResponseType.json,
        connectTimeout: const Duration(seconds: 30),
        headers: {HttpHeaders.authorizationHeader: 'Bearer $token'},
      ),
    );
  }
}
