import 'package:ecommerce/core/error_handling/result.dart';
import 'package:ecommerce/core/helpers/products_helper.dart';
import 'package:ecommerce/features/products/data/datasources/product_local_datasource_impl.dart';
import 'package:ecommerce/features/products/data/models/product_model.dart';
import 'package:ecommerce/features/products/domain/entities/product.dart';
import 'package:ecommerce/features/products/domain/usecases/get_products.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  final ProductLocalDataSource localDataSource;
  final GetProducts getProductsUseCase;

  ProductsCubit({
    required this.localDataSource,
    required this.getProductsUseCase,
  }) : super(ProductsInitial());

  Future<void> getProducts() async {
    emit(ProductsLoading());
    final result = await getProductsUseCase.call();
    // extract set of categories from the products
    if (result is Success<List<Product>>) {
      final products = result.data;
      final Set<String> categories = products.map((e) => e.category).toSet();
      // split the products into two lists for the alternating items lists
      final List<Product> firstList;
      final List<Product> secondList;
      (firstList, secondList) = ProductsHelper.splitProducts(products);
      emit(ProductsLoaded(firstList, secondList, categories, 0));
    } else if (result is Failure<List<Product>>) {
      result.error.message == "No Internet Connection"
          ? getProductsFromCache()
          : emit(ProductsError(result.error.message, result.error.statusCode));
    }
  }

  Future<void> getProductsFromCache() async {
    emit(ProductsLoading());
    // get the cached products list from shared preferences
    final cached = localDataSource.getCachedProducts();
    if (cached != null) {
      // convert the cached products list to a list of products
      final List<Product> products = cached.map((e) => e.toEntity()).toList();
      // split the products into two lists for the alternating items lists
      final List<Product> firstList;
      final List<Product> secondList;
      (firstList, secondList) = ProductsHelper.splitProducts(products);
      emit(ProductsOffline(firstList, secondList));
    } else {
      // if json list is empty, return error
      emit(ProductsError("No Internet Connection", null));
    }
  }

  // filter products by category
  Future<void> filterProducts(int categoryIndex) async {
    emit(ProductsLoading());

    if (categoryIndex != 0) {
      final result = await getProductsUseCase.call();
      if (result is Success<List<Product>>) {
        final products = result.data;
        final Set<String> categories = products.map((e) => e.category).toSet();
        products.removeWhere(
          (e) => e.category != categories.elementAt(categoryIndex - 1),
        );
        // split the products into two lists for the alternating items lists
        final List<Product> firstList;
        final List<Product> secondList;
        (firstList, secondList) = ProductsHelper.splitProducts(products);
        emit(ProductsLoaded(firstList, secondList, categories, categoryIndex));
      } else if (result is Failure<List<Product>>) {
        emit(ProductsError(result.error.toString(), result.error.statusCode));
      }
    } else {
      getProducts();
    }
  }
}
