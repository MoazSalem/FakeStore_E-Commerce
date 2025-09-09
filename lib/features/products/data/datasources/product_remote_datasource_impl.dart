import 'package:ecommerce/features/products/data/api/product_api_client.dart';
import 'package:ecommerce/features/products/data/models/product_model.dart';
import 'package:ecommerce/features/products/domain/datasources/product_remote_datasource.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: ProductRemoteDataSource)
class ProductRemoteDataSourceImpl implements ProductRemoteDataSource {
  final ProductApiClient apiClient;

  ProductRemoteDataSourceImpl(this.apiClient);

  @override
  Future<List<ProductModel>> getProducts() => apiClient.getProducts();

  @override
  Future<ProductModel> getProduct(int id) => apiClient.getProduct(id);
}
