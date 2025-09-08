import 'package:ecommerce/core/error_handling/result.dart';
import 'package:ecommerce/features/products/domain/entities/product.dart';

abstract class GetProducts {
  Future<Result<List<Product>>> call();
}
