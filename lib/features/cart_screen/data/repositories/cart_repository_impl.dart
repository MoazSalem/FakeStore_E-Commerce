import 'package:dio/dio.dart';
import 'package:ecommerce/core/error_handling/error_handling.dart';
import 'package:ecommerce/core/error_handling/result.dart';
import 'package:ecommerce/core/utils/consts_manager.dart';
import 'package:ecommerce/features/cart_screen/data/models/cart_model.dart';
import 'package:ecommerce/features/cart_screen/domain/entities/cart.dart';
import 'package:ecommerce/features/cart_screen/domain/repositories/cart_repository.dart';
import 'package:ecommerce/features/home_screen/domain/entities/product.dart';

class CartRepositoryImpl implements CartRepository {
  final Dio dio;
  CartRepositoryImpl({required this.dio});

  @override
  Future<Result<Cart>> getCart(int cartId) async {
    try {
      final response = await dio.get('${ConstsManager.baseUrl}/carts/$cartId');
      final CartModel cartModel = CartModel.fromJson(response.data);
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
      final response = await dio.delete(
        '${ConstsManager.baseUrl}/carts/$cartId',
      );
      if (response.statusCode == 200) {
        return Success(null);
      } else {
        return Failure(DioErrorHandler.handleError(response));
      }
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
