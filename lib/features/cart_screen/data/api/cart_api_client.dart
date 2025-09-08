import 'package:dio/dio.dart';
import 'package:ecommerce/core/utils/consts_manager.dart';
import 'package:retrofit/retrofit.dart';
import 'package:ecommerce/features/home_screen/data/models/product_model.dart';

part 'cart_api_client.g.dart';

@RestApi(baseUrl: ConstsManager.baseUrl)
abstract class CartApiClient {
  factory CartApiClient(Dio dio, {String baseUrl}) = _CartApiClient;

  @GET("//carts/{id}")
  Future<ProductModel> getProduct(@Path("id") int id);
}
