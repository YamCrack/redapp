import 'package:dio/dio.dart';

class DioExceptions implements Exception {
  DioExceptions.fromDioError(DioError dioError) {
    switch (dioError.type) {
      case DioErrorType.cancel:
        message = 'Request to API server was cancelled';
        break;
      case DioErrorType.connectTimeout:
        message = 'Connection timeout with API server';
        break;
      case DioErrorType.receiveTimeout:
        message = 'Receive timeout in connection with API server';
        break;
      case DioErrorType.response:
        print('==========> response data: ${(dioError.response?.data as Map<String, dynamic>).keys}');

        if (dioError.response?.data is Map) {
          final map = dioError.response!.data as Map<String, dynamic>;
          if (map.containsKey('error')) {
            message = map['error'] as String;
            break;
          } else if (map.containsKey('message')) {
            message = map['message'] as String;
            break;
          }
        }

        message = _handleError(
          dioError.response?.statusCode ?? 400,
          dioError.response?.data,
        );

        break;
      case DioErrorType.sendTimeout:
        message = 'Send timeout in connection with API server';
        break;
      case DioErrorType.other:
        if (dioError.message.contains('SocketException')) {
          message = 'No Internet';
          break;
        }
        message = 'Unexpected error occurred';
        break;
      // default:
      //   message = 'Something went wrong';
      //   break;
    }
  }

  late String message;

  String _handleError(int statusCode, dynamic error) {
    switch (statusCode) {
      case 400:
        return 'Bad request';
      case 401:
        return 'Unauthorized';
      case 403:
        return 'Forbidden';
      case 404:
        return 'Not found';
      case 500:
        return 'Internal server error';
      case 502:
        return 'Bad gateway';
      default:
        return 'Oops something went wrong';
    }
  }

  @override
  String toString() => message;
}
