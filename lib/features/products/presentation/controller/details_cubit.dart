import 'package:ecommerce/core/error_handling/result.dart';
import 'package:ecommerce/features/products/domain/entities/product.dart';
import 'package:ecommerce/features/products/domain/usecases/get_product.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'details_state.dart';

class DetailsCubit extends Cubit<DetailsState> {
  final GetProduct getProductUseCase;

  DetailsCubit({required this.getProductUseCase}) : super(DetailsInitial());

  getProduct({required int id}) async {
    emit(DetailsLoading());
    final result = await getProductUseCase.call(id);
    if (result is Success<Product>) {
      emit(DetailsLoaded(product: result.data, productCount: 1));
    } else if (result is Failure<Product>) {
      emit(DetailsError(message: result.error.toString()));
    }
  }

  // while we want to keep the deep linking feature, we can skip the getProduct method and pass the product to the cubit if it's not null
  setProduct(final Product? product, final int id) {
    try {
      // if product is null, get it from the api
      if (product == null) {
        getProduct(id: id);
      } else {
        emit(DetailsLoaded(product: product, productCount: 1));
      }
    } catch (e) {
      emit(DetailsError(message: e.toString()));
    }
  }

  void changeProductCount(final int count, final Product product) {
    try {
      emit(DetailsLoaded(product: product, productCount: count));
    } catch (e) {
      emit(DetailsError(message: e.toString()));
    }
  }
}
