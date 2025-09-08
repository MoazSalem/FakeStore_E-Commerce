import 'package:dio/dio.dart';
import 'package:ecommerce/core/utils/consts_manager.dart';
import 'package:retrofit/retrofit.dart';
import 'package:ecommerce/features/home_screen/data/models/product_model.dart';

part 'product_api_client.g.dart';

@RestApi(baseUrl: ConstsManager.baseUrl)
abstract class ProductApiClient {
  factory ProductApiClient(Dio dio, {String baseUrl}) = _ProductApiClient;

  @GET("/products")
  Future<List<ProductModel>> getProducts();

  @GET("/products/{id}")
  Future<ProductModel> getProduct(@Path("id") int id);
}
