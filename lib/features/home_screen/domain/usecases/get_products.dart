import 'package:ecommerce/features/home_screen/domain/entities/product.dart';

abstract class GetProducts {
  Future<List<Product>> call();
}
