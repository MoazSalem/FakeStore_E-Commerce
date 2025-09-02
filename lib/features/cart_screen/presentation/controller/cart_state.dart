part of 'cart_cubit.dart';

@immutable
sealed class CartState {}

final class CartInitial extends CartState {}

final class CartLoading extends CartState {}

final class CartLoaded extends CartState {
  final Cart cart;
  final List<Product> products;
  final double totalAmount;
  final int count;
  CartLoaded({
    required this.cart,
    required this.products,
    required this.totalAmount,
    required this.count,
  });
}

final class CartError extends CartState {
  final String message;
  CartError({required this.message});
}
