part of 'saved_cubit.dart';

@immutable
sealed class SavedState {}

final class SavedInitial extends SavedState {}

final class SavedLoading extends SavedState {}

final class SavedLoaded extends SavedState {
  final List<Product> savedProducts;
  final Set<int> savedProductsIds;
  SavedLoaded(this.savedProducts, this.savedProductsIds);
}

final class SavedError extends SavedState {
  final String message;

  SavedError(this.message);
}
