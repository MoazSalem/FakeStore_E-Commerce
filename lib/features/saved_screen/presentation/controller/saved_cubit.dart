import 'package:ecommerce/features/details_screen/domain/usecases/get_product.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ecommerce/features/home_screen/domain/entities/product.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'saved_state.dart';

class SavedCubit extends Cubit<SavedState> {
  SavedCubit() : super(SavedInitial());

  void getSavedProductsIds() {
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
      emit(SavedLoaded(null, savedProductsIds));
    } catch (e) {
      emit(SavedError(e.toString()));
    }
  }

  void saveId(int id, Set<int> savedProductsIds, {bool remove = false}) {
    // Remove/add id from/to set of ids
    remove ? savedProductsIds.remove(id) : savedProductsIds.add(id);
    // Save set of ids to shared preferences
    GetIt.I.get<SharedPreferences>().setStringList(
      'savedProductsIds',
      savedProductsIds.map((e) => e.toString()).toList(),
    );
    emit(SavedLoaded(null, savedProductsIds));
  }

  void getSavedProducts(Set<int> savedProductsIds) async {
    emit(SavedLoading());
    try {
      // Get saved products from api
      final List<Product> savedProducts = [];
      for (int i = 0; i < savedProductsIds.length; i++) {
        savedProducts.add(
          await GetIt.I
              .get<GetProduct>(param1: savedProductsIds.elementAt(i))
              .call(),
        );
      }
      emit(SavedLoaded(savedProducts, savedProductsIds));
    } catch (e) {
      emit(SavedError(e.toString()));
    }
  }
}
