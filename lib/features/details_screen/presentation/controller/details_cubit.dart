import 'package:ecommerce/features/details_screen/domain/usecases/get_product.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ecommerce/features/home_screen/domain/entities/product.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';

part 'details_state.dart';

class DetailsCubit extends Cubit<DetailsState> {
  DetailsCubit() : super(DetailsInitial());

  getProduct({required int id}) async {
    emit(DetailsLoading());
    try {
      final product = await GetIt.I.get<GetProduct>(param1: id).call();
      emit(DetailsLoaded(product: product, productCount: 1));
    } catch (e) {
      emit(DetailsError(message: e.toString()));
    }
  }

  void changeProductCount(final int count, final Product product) {
    emit(DetailsLoaded(product: product, productCount: count));
  }
}
