part of 'details_cubit.dart';

@immutable
sealed class DetailsState {}

final class DetailsInitial extends DetailsState {}

final class DetailsLoading extends DetailsState {}

final class DetailsLoaded extends DetailsState {
  final int productCount;
  final Product product;
  DetailsLoaded({required this.product, required this.productCount});
}

final class DetailsError extends DetailsState {
  final String message;
  DetailsError({required this.message});
}
