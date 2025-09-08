import 'dart:convert';

import 'package:ecommerce/core/error_handling/result.dart';
import 'package:ecommerce/features/products/data/models/product_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ecommerce/features/products/domain/entities/product.dart';
import 'package:ecommerce/features/products/domain/usecases/get_products.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit() : super(ProductsInitial());

  Future<void> getProducts() async {
    emit(ProductsLoading());
    final result = await GetIt.I.get<GetProducts>().call();
    // extract set of categories from the products
    if (result is Success<List<Product>>) {
      final products = result.data;
      final Set<String> categories = products.map((e) => e.category).toSet();
      // split the products into two lists for the alternating items lists
      final firstList = [
        for (var i = 0; i < products.length; i += 2) products[i],
      ];
      final secondList = [
        for (var i = 1; i < products.length; i += 2) products[i],
      ];
      emit(ProductsLoaded(firstList, secondList, categories, 0));
    } else if (result is Failure<List<Product>>) {
      result.error.message == "No Internet Connection"
          ? getProductsFromCache()
          : emit(ProductsError(result.error.message, result.error.statusCode));
    }
  }

  Future<void> getProductsFromCache() async {
    emit(ProductsLoading());
    // get the json list from shared preferences
    final jsonList = jsonDecode(
      GetIt.I.get<SharedPreferences>().getString('lastFetchedProducts') ?? "",
    );
    // if json list is empty, return error
    emit(ProductsError("No Internet Connection", null));
    // convert the json list to a list of products
    final List<Product> products = jsonList
        .map<Product>((e) => ProductModel.fromJson(e).toEntity())
        .toList();
    final firstList = [
      for (var i = 0; i < products.length; i += 2) products[i],
    ];
    final secondList = [
      for (var i = 1; i < products.length; i += 2) products[i],
    ];
    emit(ProductsOffline(firstList, secondList));
  }

  // filter products by category
  Future<void> filterProducts(int categoryIndex) async {
    emit(ProductsLoading());

    if (categoryIndex != 0) {
      final result = await GetIt.I.get<GetProducts>().call();
      if (result is Success<List<Product>>) {
        final products = result.data;
        final Set<String> categories = products.map((e) => e.category).toSet();
        products.removeWhere(
          (e) => e.category != categories.elementAt(categoryIndex - 1),
        );
        final firstList = [
          for (var i = 0; i < products.length; i += 2) products[i],
        ];
        final secondList = [
          for (var i = 1; i < products.length; i += 2) products[i],
        ];
        emit(ProductsLoaded(firstList, secondList, categories, categoryIndex));
      } else if (result is Failure<List<Product>>) {
        emit(ProductsError(result.error.toString(), result.error.statusCode));
      }
    } else {
      getProducts();
    }
  }
}
