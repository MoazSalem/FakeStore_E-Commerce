import 'package:ecommerce/features/products/data/api/product_api_client.dart';
import 'package:ecommerce/features/products/data/models/product_model.dart';

class ProductRemoteDataSource {
  final ProductApiClient apiClient;

  ProductRemoteDataSource(this.apiClient);

  Future<List<ProductModel>> getProducts() => apiClient.getProducts();

  Future<ProductModel> getProduct(int id) => apiClient.getProduct(id);
}
