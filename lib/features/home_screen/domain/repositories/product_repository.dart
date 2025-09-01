import 'package:ecommerce/core/error_handling/result.dart';
import 'package:ecommerce/features/home_screen/domain/entities/product.dart';

abstract class ProductRepository {
  Future<Result<List<Product>>> getProducts();
  Future<Result<Product>> getProduct({required String id});
}
