import 'dart:convert';

import 'package:ecommerce/features/products/data/models/product_model.dart';
import 'package:ecommerce/features/products/domain/datasources/product_local_datasource.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@LazySingleton(as: ProductLocalDataSource)
class ProductLocalDataSourceImpl implements ProductLocalDataSource {
  final SharedPreferences prefs;

  ProductLocalDataSourceImpl(this.prefs);

  @override
  Future<void> cacheProducts(List<ProductModel> products) async {
    await prefs.setString(
      'lastFetchedProducts',
      jsonEncode(products.map((e) => e.toJson()).toList()),
    );
  }

  @override
  List<ProductModel>? getCachedProducts() {
    final data = prefs.getString('lastFetchedProducts');
    if (data == null) return null;
    return (jsonDecode(data) as List)
        .map((e) => ProductModel.fromJson(e))
        .toList();
  }
}
