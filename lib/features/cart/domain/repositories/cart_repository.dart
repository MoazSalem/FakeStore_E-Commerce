import 'package:ecommerce/core/error_handling/result.dart';
import 'package:ecommerce/features/cart/domain/entities/cart.dart';
import 'package:ecommerce/features/products/domain/entities/product.dart';

abstract class CartRepository {
  Future<Result<Cart>> getCart(int cartId);

  Future<void> createCart(int cartId, int userId, List<Product> product);

  Future<Result<void>> updateCart(
    int cartId,
    int userId,
    List<Product> product,
  );

  Future<Result<void>> deleteCart(int cartId);
}
