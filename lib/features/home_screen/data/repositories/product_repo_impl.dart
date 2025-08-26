import 'package:ecommerce/core/utils/consts_manager.dart';
import 'package:ecommerce/features/home_screen/data/models/product_model.dart';
import 'package:ecommerce/features/home_screen/domain/entities/product.dart';
import 'package:ecommerce/features/home_screen/domain/repositories/product_repository.dart';
import 'package:dio/dio.dart';

class ProductRepoImpl implements ProductRepository {
  final Dio dio;
  ProductRepoImpl({required this.dio});

  @override
  Future<List<Product>> getProducts() async {
    // get products from the api
    final response = await dio.get(
      ConstsManager.baseUrl + ConstsManager.productsEndpoint,
    );
    if (response.statusCode == 200) {
      final data = response.data;
      // convert the data to a list of products
      return data
          .map<Product>((e) => ProductModel.fromJson(e).toEntity())
          .toList();
    } else {
      // TODO: handle errors
      throw Exception("Failed to load products");
    }
  }
}
