import 'package:ecommerce/features/home_screen/domain/entities/product.dart';
import 'package:ecommerce/features/home_screen/domain/repositories/product_repository.dart';
import 'package:ecommerce/features/home_screen/domain/usecases/get_products.dart';

class GetProductsImpl implements GetProducts {
  final ProductRepository repository;
  GetProductsImpl(this.repository);
  @override
  Future<List<Product>> call() => repository.getProducts();
}
