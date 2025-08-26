part of 'products_cubit.dart';

@immutable
sealed class ProductsState {}

final class ProductsInitial extends ProductsState {}

final class ProductsLoading extends ProductsState {}

final class ProductsLoaded extends ProductsState {
  final List<Product> firstList;
  final List<Product> secondList;
  ProductsLoaded(this.firstList, this.secondList);
}

final class ProductsError extends ProductsState {
  final String message;
  ProductsError(this.message);
}
