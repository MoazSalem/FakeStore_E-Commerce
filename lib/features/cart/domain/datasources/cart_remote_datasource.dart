import 'package:ecommerce/features/cart/data/models/cart_model.dart';

abstract class CartRemoteDataSource {
  Future<CartModel> getCart(int id);
}
