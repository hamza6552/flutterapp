import 'package:dio/dio.dart';

class DioExceptions implements Exception {
  DioExceptions.fromDioError(DioError dioError) {
    switch (dioError.type) {
      case DioErrorType.cancel:
        message = "Request to API server was cancelled";
        break;
      case DioErrorType.connectTimeout:
        message = "Connection timeout with API server";
        break;
      case DioErrorType.other:
        message = "Connection to API server failed due to internet connection";
        break;
      case DioErrorType.receiveTimeout:
        message = "Receive timeout in connection with API server";
        break;
      case DioErrorType.response:
        message = _handleError(
            dioError.response!.statusCode!, dioError.response!.data);
        break;
      case DioErrorType.sendTimeout:
        message = "Send timeout in connection with API server";
        break;
      default:
        message = "Something went wrong";
        break;
    }
  }
  String? message;

  String? _handleError(int statusCode, dynamic error) {
    switch (statusCode) {
      case 400:
        return 'Bad request 400';
      case 401:
        return 'UnauthorisedRequest 401';
      case 403:
        return 'UnauthorisedRequest 403';
      case 404:
        return 'Not found 404';
      case 409:
        return 'Conflict error 409';
      case 408:
        return 'Request timeout error 408';
      case 500:
        return 'Internal server error 500';
      case 503:
        return 'Service Unavailable 503';
      default:
        return 'Oops something went wrong';
    }
  }

  @override
  String toString() => message!;
}
