import 'package:dio/dio.dart';

class ErrorException implements Exception {
  final String message;
  final int? statusCode;

  ErrorException(this.message, {this.statusCode});

  @override
  String toString() => 'AppException: $message (code: $statusCode)';
}

// A helper class to handle Dio errors and map them to AppException
class DioErrorHandler {
  static ErrorException handleError(dynamic error) {
    if (error is DioException) {
      switch (error.type) {
        case DioExceptionType.connectionTimeout:
          return ErrorException("Connection timeout, please try again.");

        case DioExceptionType.sendTimeout:
          return ErrorException("Send timeout, please try again.");

        case DioExceptionType.receiveTimeout:
          return ErrorException("Receive timeout, please try again.");

        case DioExceptionType.badResponse:
          return _handleBadResponse(error.response);

        case DioExceptionType.cancel:
          return ErrorException("Request was cancelled.");

        case DioExceptionType.connectionError:
          return ErrorException("No Internet connection.");

        case DioExceptionType.unknown:
        default:
          return ErrorException("Unexpected error occurred.");
      }
    } else {
      // Any other unexpected error
      return ErrorException("Something went wrong, please try again.");
    }
  }

  static ErrorException _handleBadResponse(Response? response) {
    final statusCode = response?.statusCode ?? 0;
    final data = response?.data;

    String message = "Unexpected server error.";

    if (statusCode >= 400 && statusCode < 500) {
      message = data is Map && data['message'] != null
          ? data['message']
          : "Client error occurred. (code $statusCode)";
    } else if (statusCode >= 500) {
      message = "Server error occurred. Please try again later.";
    }

    return ErrorException(message, statusCode: statusCode);
  }
}
