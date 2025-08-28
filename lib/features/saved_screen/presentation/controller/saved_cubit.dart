import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ecommerce/core/dependency_injection/dependency_injection.dart';
import 'package:ecommerce/features/home_screen/domain/entities/product.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'saved_state.dart';

class SavedCubit extends Cubit<SavedState> {
  SavedCubit() : super(SavedInitial());

  void getSavedProductsIds() {
    emit(SavedLoading());
    try {
      // Get saved products ids from shared preferences
      final List<String> listOfIds =
          getIt<SharedPreferences>().getStringList('savedProductsIds') ?? [];
      // Convert list of ids to set of ids
      final Set<int> savedProductsIds = listOfIds
          .map((e) => int.parse(e))
          .toSet();
      emit(SavedLoaded(null, savedProductsIds));
    } catch (e) {
      emit(SavedError(e.toString()));
    }
  }

  void saveId(int id, {bool remove = false}) {
    // Get saved products ids from shared preferences
    final List<String> listOfIds =
        getIt<SharedPreferences>().getStringList('savedProductsIds') ?? [];
    // Convert list of ids to set of ids
    final Set<int> savedProductsIds = listOfIds
        .map((e) => int.parse(e))
        .toSet();
    // Remove/add id from/to set of ids
    remove ? savedProductsIds.remove(id) : savedProductsIds.add(id);
    // Save set of ids to shared preferences
    getIt.get<SharedPreferences>().setStringList(
      'savedProductsIds',
      savedProductsIds.map((e) => e.toString()).toList(),
    );
    emit(SavedLoaded(null, savedProductsIds));
  }
}
