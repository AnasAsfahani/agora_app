import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';


class DioFactory {
  DioFactory._();

  static Dio? _dio;
 // static final FlutterSecureStorage _storage = const FlutterSecureStorage();

  static Dio getDio() {
    if (_dio != null) return _dio!;

    final dio = Dio(
      BaseOptions(
        connectTimeout: const Duration(seconds: 60),
        receiveTimeout: const Duration(seconds: 60),
        headers: {'Accept': 'application/json'},
      ),
    );

    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
      //     try {
      // //      final token = await _storage.read(key: SharedPrefKeys.accessToken);
      // //       if (token != null && token.isNotEmpty) {
      // //         options.headers['Authorization'] = 'Bearer $token';
      // //       }
      //     } on Exception catch (e) {
      //     }

          return handler.next(options);
        },
        onResponse: (response, handler) {
          return handler.next(response);
        },
        onError: (DioException error, handler) {
          if (error.response?.statusCode == 401) {
            log('⚠️ Unauthorized - 401');
          }
          handler.next(error);
        },
      ),
    );

    // Logging Interceptor
    dio.interceptors.add(
      PrettyDioLogger(
        logPrint: (object) => log(object.toString()),
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        error: true,
        compact: true,
      ),
    );

    _dio = dio;
    return _dio!;
  }

  /// Optional: Reset dio instance
  static void reset() {
    _dio = null;
  }
}
