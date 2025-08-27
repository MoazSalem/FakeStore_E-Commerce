part of 'main_screen_cubit.dart';

@immutable
sealed class MainScreenState {}

final class MainScreenInitial extends MainScreenState {}

final class MainScreenLoading extends MainScreenState {}

final class MainScreenLoaded extends MainScreenState {
  final int index;
  MainScreenLoaded({required this.index});
}
