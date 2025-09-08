import 'dart:convert';

import 'package:ecommerce/features/products/data/models/product_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProductLocalDataSource {
  final SharedPreferences prefs;

  ProductLocalDataSource(this.prefs);

  Future<void> cacheProducts(List<ProductModel> products) async {
    await prefs.setString(
      'lastFetchedProducts',
      jsonEncode(products.map((e) => e.toJson()).toList()),
    );
  }

  List<ProductModel>? getCachedProducts() {
    final data = prefs.getString('lastFetchedProducts');
    if (data == null) return null;
    return (jsonDecode(data) as List)
        .map((e) => ProductModel.fromJson(e))
        .toList();
  }
}
