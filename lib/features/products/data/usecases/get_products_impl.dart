import 'package:ecommerce/core/error_handling/result.dart';
import 'package:ecommerce/features/products/domain/entities/product.dart';
import 'package:ecommerce/features/products/domain/repositories/product_repository.dart';
import 'package:ecommerce/features/products/domain/usecases/get_products.dart';

class GetProductsImpl implements GetProducts {
  final ProductRepository repository;
  GetProductsImpl(this.repository);
  @override
  Future<Result<List<Product>>> call() => repository.getProducts();
}
