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
      double totalAmount = 0;
      int totalQuantity = 0;
      for (var product in cart.productsDetails) {
        final result = await GetIt.instance<GetProduct>(
          param1: product.productId,
        ).call();
        if (result is Success<Product>) {
          products.add(result.data);
          totalAmount += product.quantity * result.data.price;
        } else if (result is Failure<Product>) {
          emit(
            CartError(
              message: result.error.toString(),
              statusCode: result.error.statusCode,
            ),
          );
        }
        totalQuantity += product.quantity;
      }
      emit(
        CartLoaded(
          cart: cart,
          products: products,
          totalAmount: totalAmount,
          count: totalQuantity,
        ),
      );
    } else if (result is Failure<Cart>) {
      emit(
        CartError(
          message: result.error.toString(),
          statusCode: result.error.statusCode,
        ),
      );
    }
  }

  changeQuantity({
    required int productId,
    required CartLoaded state,
    bool isIncrement = true,
  }) {
    // getting the data from the old state is not the best practice, but it is the easiest way to do it for now
    final Cart newCart = state.cart.copyWith(
      productsDetails: state.cart.productsDetails.map((product) {
        if (product.productId == productId) {
          return product.copyWith(
            quantity: isIncrement ? product.quantity + 1 : product.quantity - 1,
          );
        }
        return product;
      }).toList(),
    );
    final double newTotalAmount =
        state.totalAmount +
        (isIncrement
            ? state.products
                  .firstWhere((element) => element.id == productId)
                  .price
            : -state.products
                  .firstWhere((element) => element.id == productId)
                  .price);
    final int newCount = state.count + (isIncrement ? 1 : -1);
    emit(
      CartLoaded(
        cart: newCart,
        products: state.products,
        totalAmount: newTotalAmount,
        count: newCount,
      ),
    );
  }
}
