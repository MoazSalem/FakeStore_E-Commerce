import 'package:ecommerce/features/cart/data/api/cart_api_client.dart';
import 'package:ecommerce/features/cart/data/models/cart_model.dart';
import 'package:ecommerce/features/cart/domain/datasources/cart_remote_datasource.dart';

class CartRemoteDataSourceImpl implements CartRemoteDataSource {
  final CartApiClient apiClient;

  CartRemoteDataSourceImpl(this.apiClient);

  @override
  Future<CartModel> getCart(int id) => apiClient.getCart(id);
}
