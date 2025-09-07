part of 'products_cubit.dart';

@immutable
sealed class ProductsState {}

final class ProductsInitial extends ProductsState {}

final class ProductsLoading extends ProductsState {}

final class ProductsLoaded extends ProductsState {
  final List<Product> firstList;
  final List<Product> secondList;
  final Set<String> categories;
  final int currentCategoryIndex;
  ProductsLoaded(
    this.firstList,
    this.secondList,
    this.categories,
    this.currentCategoryIndex,
  );
}

final class ProductsError extends ProductsState {
  final String message;
  final int? statusCode;
  ProductsError(this.message, this.statusCode);
}

final class ProductsOffline extends ProductsState {}
