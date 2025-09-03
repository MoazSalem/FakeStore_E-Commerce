part of 'cart_cubit.dart';

@immutable
sealed class CartState {}

final class CartInitial extends CartState {}

final class CartLoading extends CartState {}

final class CartLoaded extends CartState {
  final Cart cart;
  final List<Product> products;
  CartLoaded({required this.cart, required this.products});
  int get count =>
      cart.productsDetails.fold(0, (sum, product) => sum + product.quantity);

  double get totalAmount {
    return cart.productsDetails.fold(0, (sum, cartItem) {
      final product = products.firstWhere((p) => p.id == cartItem.productId);
      return sum + product.price * cartItem.quantity;
    });
  }
}

final class CartError extends CartState {
  final String message;
  final int? statusCode;
  CartError({required this.message, this.statusCode});
}
