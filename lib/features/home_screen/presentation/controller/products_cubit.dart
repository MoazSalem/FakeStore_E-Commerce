import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ecommerce/features/home_screen/data/usecases/get_products_impl.dart';
import 'package:ecommerce/features/home_screen/domain/entities/product.dart';
import 'package:ecommerce/features/home_screen/domain/repositories/product_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';

part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit() : super(ProductsInitial());

  Future<void> getProducts() async {
    emit(ProductsLoading());
    try {
      final products = await GetProductsImpl(
        GetIt.instance.get<ProductRepository>(),
      ).call();
      emit(ProductsLoaded(products));
    } catch (e) {
      emit(ProductsError(e.toString()));
    }
  }
}
