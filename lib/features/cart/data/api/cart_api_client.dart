import 'package:dio/dio.dart';
import 'package:ecommerce/features/cart/data/models/cart_model.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

part 'cart_api_client.g.dart';

@lazySingleton
@RestApi()
abstract class CartApiClient {
  @factoryMethod
  factory CartApiClient(Dio dio) = _CartApiClient;

  @GET("/carts/{id}")
  Future<CartModel> getCart(@Path("id") int id);
}
