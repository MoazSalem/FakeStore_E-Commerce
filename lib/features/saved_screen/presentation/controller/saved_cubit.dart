import 'package:ecommerce/core/error_handling/result.dart';
import 'package:ecommerce/features/details_screen/domain/usecases/get_product.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ecommerce/features/home_screen/domain/entities/product.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'saved_state.dart';

class SavedCubit extends Cubit<SavedState> {
  SavedCubit() : super(SavedInitial());

  void getSavedProducts() async {
    emit(SavedLoading());
    try {
      // Get saved products ids from shared preferences
      final List<String> listOfIds =
          GetIt.I.get<SharedPreferences>().getStringList('savedProductsIds') ??
          [];
      // Convert list of ids to set of ids
      final Set<int> savedProductsIds = listOfIds
          .map((e) => int.parse(e))
          .toSet();
      // Get saved products from api
      final List<Product> savedProducts = [];
      // if saved products ids is empty, return empty list
      if (savedProductsIds.isEmpty) {
        emit(SavedLoaded(savedProducts, savedProductsIds));
        return;
      }
      for (int i = 0; i < savedProductsIds.length; i++) {
        final result = await GetIt.I
            .get<GetProduct>(param1: savedProductsIds.elementAt(i))
            .call();
        if (result is Success<Product>) {
          savedProducts.add(result.data);
          emit(SavedLoaded(savedProducts, savedProductsIds));
        }
      }
    } catch (e) {
      emit(SavedError(e.toString()));
    }
  }

  void saveId(int id, Set<int> savedProductsIds, {bool remove = false}) {
    try {
      // Remove/add id from/to set of ids
      remove ? savedProductsIds.remove(id) : savedProductsIds.add(id);
      // Save set of ids to shared preferences
      GetIt.I.get<SharedPreferences>().setStringList(
        'savedProductsIds',
        savedProductsIds.map((e) => e.toString()).toList(),
      );
      getSavedProducts();
    } catch (e) {
      emit(SavedError(e.toString()));
    }
  }
}
