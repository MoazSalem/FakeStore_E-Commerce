import 'package:ecommerce/features/products/domain/entities/product.dart';

class ProductsHelper {
  static (List<Product>, List<Product>) splitProducts(List<Product> products) {
    final first = [for (var i = 0; i < products.length; i += 2) products[i]];
    final second = [for (var i = 1; i < products.length; i += 2) products[i]];
    return (first, second);
  }
}
