import 'package:ecommerce/core/error_handling/result.dart';
import 'package:ecommerce/features/products/domain/usecases/get_product.dart';
import 'package:ecommerce/features/products/domain/entities/product.dart';
import 'package:ecommerce/features/products/domain/repositories/product_repository.dart';

class GetProductImpl implements GetProduct {
  final ProductRepository repository;
  final int id;
  GetProductImpl({required this.repository, required this.id});
  @override
  Future<Result<Product>> call() => repository.getProduct(id: id.toString());
}
