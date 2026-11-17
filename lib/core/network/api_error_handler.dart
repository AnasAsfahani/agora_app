import 'dart:developer';
import 'package:dio/dio.dart';
import '../errors/error_model.dart';

class ApiErrorHandler {
  static ErrorModel handle(dynamic error) {
    if (error is DioException) {
      final int statusCode =
          error.response?.statusCode ?? _defaultStatusCode(error.type);

      switch (error.type) {
        case DioExceptionType.connectionError:
          return _error(statusCode, 'Connection error');
        case DioExceptionType.badCertificate:
          return _error(statusCode, 'Bad certificate');
        case DioExceptionType.cancel:
          return _error(statusCode, 'Request was cancelled');
        case DioExceptionType.connectionTimeout:
          return _error(statusCode, 'Connection timeout');
        case DioExceptionType.receiveTimeout:
          return _error(statusCode, 'Receive timeout');
        case DioExceptionType.sendTimeout:
          return _error(statusCode, 'Send timeout');
        case DioExceptionType.badResponse:
          return _handleHttpError(error.response);
        default:
          return _error(statusCode, 'Unexpected error');
      }
    } else {
      return _error(1000, 'Unknown error: ${error.toString()}');
    }
  }

  static int _defaultStatusCode(DioExceptionType type) {
    return 1000;
  }

  static ErrorModel _handleHttpError(Response? response) {
    if (response == null) {
      return _error(500, 'No response from server');
    }

    final int statusCode = response.statusCode ?? 0;
    final dynamic data = response.data;

    log('HTTP ERROR $statusCode → ${response.requestOptions.uri}');

    final String message = _extractMessage(data) ?? _defaultMessage(statusCode);

    return ErrorModel(statusCode: statusCode, message: message);
  }
static String? _extractMessage(dynamic data) {
  if (data is Map<String, dynamic> && data.containsKey('message')) {
    final message = data['message'];
    if (message != null) {
      if (message is String && message.trim().isNotEmpty) {
        return message;
      }
      if (message is List && message.isNotEmpty) {
        final first = message.first;
        if (first is String && first.trim().isNotEmpty) {
          return first;
        }
      }
    }
  }
  return null;
}

  static String _defaultMessage(int statusCode) {
    switch (statusCode) {
      case 400:
        return 'Bad request';
      case 401:
        return 'Unauthorized';
      case 403:
        return 'Forbidden';
      case 404:
        return 'Not found';
      case 408:
        return 'Request timeout';
      case 500:
        return 'Internal server error';
      case 502:
        return 'Bad gateway';
      case 495:
        return 'Bad certificate';
      case 0:
        return 'No response from server (network issue)';
      case -1:
        return 'Request was cancelled';
      case 520:
        return 'Unknown error';
      default:
        return 'Something went wrong ($statusCode)';
    }
  }

  static ErrorModel _error(int code, String message) {
    return ErrorModel(statusCode: code, message: message);
  }
}
