import 'package:ecommerce/core/error_handling/error_handling.dart';
import 'package:ecommerce/core/error_handling/result.dart';
import 'package:ecommerce/features/cart/data/models/cart_model.dart';
import 'package:ecommerce/features/cart/domain/datasources/cart_remote_datasource.dart';
import 'package:ecommerce/features/cart/domain/entities/cart.dart';
import 'package:ecommerce/features/cart/domain/repositories/cart_repository.dart';
import 'package:ecommerce/features/products/domain/entities/product.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: CartRepository)
class CartRepositoryImpl implements CartRepository {
  final CartRemoteDataSource cartRemoteDataSource;

  CartRepositoryImpl({required this.cartRemoteDataSource});

  @override
  Future<Result<Cart>> getCart(int cartId) async {
    try {
      final cartModel = await cartRemoteDataSource.getCart(cartId);
      return Success(cartModel.toEntity());
    } catch (error) {
      return Failure(DioErrorHandler.handleError(error));
    }
  }

  @override
  Future<Result<void>> updateCart(
    int cartId,
    int userId,
    List<Product> products,
  ) async {
    try {
      return Success(null);
      // final response = await dio.put(
      //   '${ConstsManager.baseUrl}/carts/$cartId',
      //   data: {
      //     'id': cartId,
      //     'userId': userId,
      //     'products': products.map((product) => product.toJson()).toList(),
      //   },
      // );
      // if (response.statusCode == 200) {
      //   return Success(null);
      // }
    } catch (error) {
      return Failure(DioErrorHandler.handleError(error));
    }
  }

  @override
  Future<Result<void>> deleteCart(int cartId) async {
    try {
      return Success(null);
      // final response = await dio.delete(
      //   '${ConstsManager.baseUrl}/carts/$cartId',
      // );
      // if (response.statusCode == 200) {
      //   return Success(null);
      // } else {
      //   return Failure(DioErrorHandler.handleError(response));
      // }
    } catch (error) {
      return Failure(DioErrorHandler.handleError(error));
    }
  }

  @override
  Future<Result<void>> createCart(
    int cartId,
    int userId,
    List<Product> products,
  ) async {
    try {
      return Success(null);
      // final response = await dio.post(
      //   '${ConstsManager.baseUrl}/carts/$cartId',
      //   data: {
      //     'id': cartId,
      //     'userId': userId,
      //     'products': products.map((product) => product.toJson()).toList(),
      //   },
      // );
      // if (response.statusCode == 200) {
      //   return Success(null);
      // }
    } catch (error) {
      return Failure(DioErrorHandler.handleError(error));
    }
  }
}
