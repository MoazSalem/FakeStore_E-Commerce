import 'package:ecommerce/features/home_screen/domain/entities/product.dart';

abstract class ProductRepository {
  Future<List<Product>> getProducts();
}
