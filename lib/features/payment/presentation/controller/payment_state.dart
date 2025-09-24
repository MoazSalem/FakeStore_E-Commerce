part of 'payment_cubit.dart';

@immutable
sealed class PaymentState {}

final class PaymentInitial extends PaymentState {}

final class PaymentLoading extends PaymentState {}

final class PaymentWalletNumber extends PaymentState {}

final class PaymentSuccess extends PaymentState {}

final class PaymentError extends PaymentState {
  final String message;
  final int? statusCode;

  PaymentError({required this.message, this.statusCode});
}
