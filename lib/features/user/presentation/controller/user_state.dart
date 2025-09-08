part of 'user_cubit.dart';

@immutable
sealed class UserState {}

final class UserInitial extends UserState {}

final class UserLoading extends UserState {}

final class UserLoaded extends UserState {
  final User user;

  UserLoaded({required this.user});
}

final class UserLoggedOut extends UserState {
  final String message;

  UserLoggedOut({required this.message});
}
