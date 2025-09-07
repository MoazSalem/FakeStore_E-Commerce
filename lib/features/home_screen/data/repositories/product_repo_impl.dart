import 'dart:convert';

import 'package:ecommerce/core/error_handling/error_handling.dart';
import 'package:ecommerce/core/error_handling/result.dart';
import 'package:ecommerce/core/utils/consts_manager.dart';
import 'package:ecommerce/features/home_screen/data/models/product_model.dart';
import 'package:ecommerce/features/home_screen/domain/entities/product.dart';
import 'package:ecommerce/features/home_screen/domain/repositories/product_repository.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProductRepoImpl implements ProductRepository {
  final Dio dio;
  ProductRepoImpl({required this.dio});

  @override
  Future<Result<List<Product>>> getProducts() async {
    // get products from the api
    try {
      final response = await dio.get(
        ConstsManager.baseUrl + ConstsManager.productsEndpoint,
      );
      // store last fetched products json in shared preferences to be used in offline mode
      GetIt.I.get<SharedPreferences>().setString(
        'lastFetchedProducts',
        jsonEncode(response.data),
      );
      return Success(
        // convert the data to a list of products
        response.data
            .map<Product>((e) => ProductModel.fromJson(e).toEntity())
            .toList(),
      );
    } catch (error) {
      return Failure(DioErrorHandler.handleError(error));
    }
  }

  @override
  Future<Result<Product>> getProduct({required String id}) async {
    // get product from the api
    try {
      final response = await dio.get(
        "${ConstsManager.baseUrl}${ConstsManager.productsEndpoint}/$id",
      );
      return Success(ProductModel.fromJson(response.data).toEntity());
    } catch (error) {
      return Failure(DioErrorHandler.handleError(error));
    }
  }
}
