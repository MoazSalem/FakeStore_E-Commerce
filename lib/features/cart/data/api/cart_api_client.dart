import 'package:dio/dio.dart';
import 'package:ecommerce/core/utils/consts_manager.dart';
import 'package:ecommerce/features/products/data/models/product_model.dart';
import 'package:retrofit/retrofit.dart';

part 'cart_api_client.g.dart';

@RestApi(baseUrl: ConstsManager.baseUrl)
abstract class CartApiClient {
  factory CartApiClient(Dio dio, {String baseUrl}) = _CartApiClient;

  @GET("//carts/{id}")
  Future<ProductModel> getProduct(@Path("id") int id);
}
