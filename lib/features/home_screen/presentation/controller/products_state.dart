part of 'products_cubit.dart';

@immutable
sealed class ProductsState {}

final class ProductsInitial extends ProductsState {}

final class ProductsLoading extends ProductsState {}

final class ProductsLoaded extends ProductsState {
  final List<Product> firstList;
  final List<Product> secondList;
  final Set<String> categories;
  ProductsLoaded(this.firstList, this.secondList, this.categories);
}

final class ProductsError extends ProductsState {
  final String message;
  ProductsError(this.message);
}
