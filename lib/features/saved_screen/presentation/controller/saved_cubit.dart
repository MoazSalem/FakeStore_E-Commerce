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
        } else if (result is Failure<Product>) {
          emit(
            SavedError(
              message: result.error.toString(),
              statusCode: result.error.statusCode,
            ),
          );
        }
      }
    } catch (error) {
      emit(SavedError(message: error.toString()));
    }
  }

  void saveId(int id, {bool remove = false}) {
    if (state is! SavedLoaded) return;
    final savedProductsIds = (state as SavedLoaded).savedProductsIds;
    try {
      // Remove/add id from/to set of ids
      remove ? savedProductsIds.remove(id) : savedProductsIds.add(id);
      // Save set of ids to shared preferences
      GetIt.I.get<SharedPreferences>().setStringList(
        'savedProductsIds',
        savedProductsIds.map((e) => e.toString()).toList(),
      );
      // Add/remove product to/from saved products
      addProduct(id, remove: remove);
    } catch (e) {
      emit(SavedError(message: e.toString()));
    }
  }

  void addProduct(int productId, {bool remove = false}) async {
    if (state is! SavedLoaded) return;
    try {
      final savedProducts = (state as SavedLoaded).savedProducts;
      // Remove product from saved products if remove is true
      if (remove) {
        savedProducts.removeWhere((e) => e.id == productId);
        emit(
          SavedLoaded(savedProducts, (state as SavedLoaded).savedProductsIds),
        );
        return;
      }
      // Get product from api
      final result = await GetIt.I.get<GetProduct>(param1: productId).call();
      if (result is Success<Product>) {
        savedProducts.add(result.data);
        emit(
          SavedLoaded(savedProducts, (state as SavedLoaded).savedProductsIds),
        );
      } else if (result is Failure<Product>) {
        emit(
          SavedError(
            message: result.error.toString(),
            statusCode: result.error.statusCode,
          ),
        );
      }
    } catch (e) {
      emit(SavedError(message: e.toString()));
    }
  }
}
