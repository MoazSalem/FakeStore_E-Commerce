import 'package:ecommerce/features/home_screen/domain/entities/product.dart';

abstract class GetProduct {
  Future<Product> call();
}
