import 'package:ecommerce/core/error_handling/error_handling.dart';

abstract class Result<T> {
  const Result();
}

// Success case
class Success<T> extends Result<T> {
  final T data;
  const Success(this.data);
}

// Failure case
class Failure<T> extends Result<T> {
  final ErrorException error;
  const Failure(this.error);
}
