import 'package:dio/dio.dart';

class ErrorException implements Exception {
  final String message;
  final int? statusCode;

  ErrorException(this.message, {this.statusCode});

  @override
  String toString() => message;
}

// A helper class to handle Dio errors and map them to AppException
class DioErrorHandler {
  static ErrorException handleError(dynamic error) {
    if (error is DioException) {
      switch (error.type) {
        case DioExceptionType.connectionTimeout:
          return ErrorException("Connection timeout, Please Try Again");

        case DioExceptionType.sendTimeout:
          return ErrorException("Send Timeout, Please Try Again");

        case DioExceptionType.receiveTimeout:
          return ErrorException("Receive Timeout, Please Try Again");

        case DioExceptionType.badResponse:
          return _handleBadResponse(error.response);

        case DioExceptionType.cancel:
          return ErrorException("Request was Cancelled");

        case DioExceptionType.connectionError:
          return ErrorException("No Internet Connection");

        case DioExceptionType.unknown:
        default:
          return ErrorException("Unexpected Error Occurred");
      }
    } else {
      // Any other unexpected error
      return ErrorException("Something Went Wrong, Please Try Again");
    }
  }

  static ErrorException _handleBadResponse(Response? response) {
    final statusCode = response?.statusCode ?? 0;
    final data = response?.data;

    String message = "Unexpected Server Error.";

    if (statusCode >= 400 && statusCode < 500) {
      message = data is Map && data['message'] != null
          ? data['message']
          : "Client Error Occurred";
    } else if (statusCode >= 500) {
      message = "Server Error Occurred. Please Try Again Later.";
    }

    return ErrorException(message, statusCode: statusCode);
  }
}
