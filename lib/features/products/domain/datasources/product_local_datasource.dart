import 'package:ecommerce/features/products/data/models/product_model.dart';

abstract class ProductLocalDataSource {
  Future<void> cacheProducts(List<ProductModel> products);

  List<ProductModel>? getCachedProducts();
}
