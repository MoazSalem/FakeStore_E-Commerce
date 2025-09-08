import 'package:ecommerce/core/error_handling/error_handling.dart';
import 'package:ecommerce/core/error_handling/result.dart';
import 'package:ecommerce/features/products/data/datasources/product_local_datasource_impl.dart';
import 'package:ecommerce/features/products/data/datasources/product_remote_datasource_impl.dart';
import 'package:ecommerce/features/products/data/models/product_model.dart';
import 'package:ecommerce/features/products/domain/entities/product.dart';
import 'package:ecommerce/features/products/domain/repositories/product_repository.dart';

class ProductRepoImpl implements ProductRepository {
  final ProductRemoteDataSource remote;
  final ProductLocalDataSource local;

  ProductRepoImpl({required this.remote, required this.local});

  @override
  Future<Result<List<Product>>> getProducts() async {
    try {
      final remoteProducts = await remote.getProducts();
      await local.cacheProducts(remoteProducts);

      return Success(remoteProducts.map((e) => e.toEntity()).toList());
    } catch (error) {
      return Failure(DioErrorHandler.handleError(error));
    }
  }

  @override
  Future<Result<Product>> getProduct({required String id}) async {
    try {
      final product = await remote.getProduct(int.parse(id));
      return Success(product.toEntity());
    } catch (error) {
      return Failure(DioErrorHandler.handleError(error));
    }
  }
}
