import 'package:dio/dio.dart';
import 'package:ecommerce/features/products/data/models/product_model.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

part 'product_api_client.g.dart';

@lazySingleton
@RestApi()
abstract class ProductApiClient {
  @factoryMethod
  factory ProductApiClient(Dio dio) = _ProductApiClient;

  @GET("/products")
  Future<List<ProductModel>> getProducts();

  @GET("/products/{id}")
  Future<ProductModel> getProduct(@Path("id") int id);
}
