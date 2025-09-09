import 'package:ecommerce/core/error_handling/result.dart';
import 'package:ecommerce/features/cart/domain/entities/cart.dart';
import 'package:ecommerce/features/cart/domain/entities/product_details.dart';
import 'package:ecommerce/features/cart/domain/usecases/get_cart.dart';
import 'package:ecommerce/features/products/domain/entities/product.dart';
import 'package:ecommerce/features/products/domain/usecases/get_product.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  final GetCartUseCase getCartUseCase;
  final GetProduct getProductUseCase;

  CartCubit({required this.getCartUseCase, required this.getProductUseCase})
    : super(CartInitial());

  void getCart(int cartId) async {
    emit(CartLoading());
    final result = await getCartUseCase.call(cartId);
    if (result is Success<Cart>) {
      final Cart cart = result.data;
      List<Product> products = [];
      for (var product in cart.productsDetails) {
        final result = await getProductUseCase.call(product.productId);
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

  void removeProduct(int productId, {int? quantity}) {
    if (state is! CartLoaded) return;
    final current = state as CartLoaded;

    // if quantity is not null, remove only the quantity of the product
    if (quantity != null) {
      final updatedCart = current.cart.copyWith(
        productsDetails: current.cart.productsDetails.map((item) {
          if (item.productId == productId) {
            return item.copyWith(quantity: item.quantity - quantity);
          }
          return item;
        }).toList(),
      );
      emit(CartLoaded(cart: updatedCart, products: current.products));
      return;
    }

    // if quantity is null, remove the product from the cart
    final updatedItems = current.cart.productsDetails
        .where((item) => item.productId != productId)
        .toList();

    final updatedCart = current.cart.copyWith(productsDetails: updatedItems);

    final updatedProducts = current.products
        .where((product) => product.id != productId)
        .toList();

    emit(CartLoaded(cart: updatedCart, products: updatedProducts));
  }

  Future<void> addProductToCart(Product product, int quantity) async {
    if (state is! CartLoaded) return;
    final current = state as CartLoaded;
    // check if the product is already in the cart
    bool isProductInCart = current.cart.productsDetails.any(
      (item) => item.productId == product.id,
    );
    // if the product is already in the cart, don't add it again
    final List<Product> updatedProducts = isProductInCart
        ? current.products
        : [...current.products, product];
    // and just increment the quantity
    final updatedCart = isProductInCart
        ? current.cart.copyWith(
            productsDetails: current.cart.productsDetails.map((item) {
              if (item.productId == product.id) {
                return item.copyWith(quantity: item.quantity + quantity);
              }
              return item;
            }).toList(),
          )
        : current.cart.copyWith(
            productsDetails: [
              ...current.cart.productsDetails,
              ProductDetails(productId: product.id, quantity: quantity),
            ],
          );
    emit(CartLoaded(cart: updatedCart, products: updatedProducts));
  }
}
