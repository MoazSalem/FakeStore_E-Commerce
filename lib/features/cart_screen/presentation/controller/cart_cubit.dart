import 'package:ecommerce/core/error_handling/result.dart';
import 'package:ecommerce/features/cart_screen/domain/usecases/get_cart.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ecommerce/features/cart_screen/domain/entities/cart.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());

  void getCart(int cartId) async {
    emit(CartLoading());
    final result = await GetIt.instance<GetCartUseCase>().call(cartId);
    if (result is Success<Cart>) {
      final Cart cart = result.data;
      double totalAmount = 0;
      for (var product in cart.products) {
        totalAmount += product.price;
      }
      emit(
        CartLoaded(
          cart: cart,
          totalAmount: totalAmount,
          count: cart.products.length,
        ),
      );
    } else if (result is Failure<Cart>) {
      emit(CartError(message: result.error.toString()));
    }
  }
}
