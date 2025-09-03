import 'package:ecommerce/core/error_handling/result.dart';
import 'package:ecommerce/features/cart_screen/domain/usecases/get_cart.dart';
import 'package:ecommerce/features/details_screen/domain/usecases/get_product.dart';
import 'package:ecommerce/features/home_screen/domain/entities/product.dart';
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
      List<Product> products = [];
      for (var product in cart.productsDetails) {
        final result = await GetIt.instance<GetProduct>(
          param1: product.productId,
        ).call();
        if (result is Success<Product>) {
          products.add(result.data);
        } else if (result is Failure<Product>) {
          emit(
            CartError(
              message: result.error.toString(),
              statusCode: result.error.statusCode,
            ),
          );
        }
      }
      emit(CartLoaded(cart: cart, products: products));
    } else if (result is Failure<Cart>) {
      emit(
        CartError(
          message: result.error.toString(),
          statusCode: result.error.statusCode,
        ),
      );
    }
  }

  void updateItemCount({required int productId, required bool isIncrement}) {
    if (state is! CartLoaded) return;
    final current = state as CartLoaded;

    final updatedItems = current.cart.productsDetails.map((item) {
      if (item.productId == productId) {
        return item.copyWith(
          quantity: isIncrement ? item.quantity + 1 : item.quantity - 1,
        );
      }
      return item;
    }).toList();

    final updatedCart = current.cart.copyWith(productsDetails: updatedItems);

    emit(CartLoaded(cart: updatedCart, products: current.products));
  }

  void removeProduct(int productId) {
    if (state is! CartLoaded) return;
    final current = state as CartLoaded;

    final updatedItems = current.cart.productsDetails
        .where((item) => item.productId != productId)
        .toList();

    final updatedCart = current.cart.copyWith(productsDetails: updatedItems);

    final updatedProducts = current.products
        .where((product) => product.id != productId)
        .toList();

    emit(CartLoaded(cart: updatedCart, products: updatedProducts));
  }
}
