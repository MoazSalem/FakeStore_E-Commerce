import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ecommerce/features/home_screen/domain/entities/product.dart';
import 'package:ecommerce/features/home_screen/domain/usecases/get_products.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';

part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit() : super(ProductsInitial());

  Future<void> getProducts() async {
    emit(ProductsLoading());
    try {
      final products = await GetIt.I.get<GetProducts>().call();
      // extract set of categories from the products
      final Set<String> categories = products.map((e) => e.category).toSet();
      // split the products into two lists for the alternating items lists
      final firstList = [
        for (var i = 0; i < products.length; i += 2) products[i],
      ];
      final secondList = [
        for (var i = 1; i < products.length; i += 2) products[i],
      ];
      emit(ProductsLoaded(firstList, secondList, categories, 0));
    } catch (e) {
      emit(ProductsError(e.toString()));
    }
  }

  // filter products by category
  Future<void> filterProducts(int categoryIndex) async {
    emit(ProductsLoading());
    try {
      if (categoryIndex != 0) {
        final products = await GetIt.I.get<GetProducts>().call();
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
      } else {
        getProducts();
      }
    } catch (e) {
      emit(ProductsError(e.toString()));
    }
  }
}
