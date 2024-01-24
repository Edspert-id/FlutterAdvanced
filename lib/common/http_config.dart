import 'package:dio/dio.dart';

const BASE_URL = 'https://edspert.widyaedu.com/';

class HttpConfig {
  static Dio dioConfig() {
    final dio = Dio();

    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        options.baseUrl = BASE_URL;
        options.headers = {'x-api-key': '18be70c0-4e4d-44ff-a475-50c51ece99a0'};
        handler.next(options);
      },
      onError: (error, handler) {
        handler.next(error);
      },
      onResponse: (response, handler) {
        handler.next(response);
      },
    ));

    return dio;
  }
}
