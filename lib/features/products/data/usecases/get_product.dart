import 'package:ecommerce/core/error_handling/result.dart';
import 'package:ecommerce/features/products/domain/entities/product.dart';
import 'package:ecommerce/features/products/domain/repositories/product_repository.dart';
import 'package:ecommerce/features/products/domain/usecases/get_product.dart';

class GetProductImpl implements GetProduct {
  final ProductRepository repository;
  GetProductImpl({required this.repository});
  @override
  Future<Result<Product>> call(int id) =>
      repository.getProduct(id: id.toString());
}
