import 'package:ecommerce/core/error_handling/result.dart';
import 'package:ecommerce/features/user/data/models/user_model.dart';
import 'package:ecommerce/features/user/domain/entities/user.dart';
import 'package:ecommerce/features/user/domain/repositories/user_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserInitial());

  void checkUser() async {
    final result = await GetIt.I<UserRepository>().checkUser();
    if (result is Success<User>) {
      emit(UserLoaded(user: result.data));
    } else if (result is Failure<User>) {
      emit(UserLoggedOut(message: result.error.message));
    }
  }

  void signUp(UserModel user) async {
    final result = await GetIt.I<UserRepository>().register(user);
    if (result is Failure<User>) {
      emit(UserLoggedOut(message: result.error.message));
    }
    emit(UserLoggedOut(message: "Successfully registered"));
  }

  void signOut() async {
    final result = await GetIt.I<UserRepository>().logout();
    if (result is Success) {
      emit(UserLoggedOut(message: "Successfully logged out"));
    } else if (result is Failure) {
      emit(UserLoggedOut(message: result.error.message));
    }
  }

  void signIn(String name) async {
    // get user from repository
    final result = await GetIt.I<UserRepository>().login(name);
    if (result is Success<User>) {
      emit(UserLoaded(user: result.data));
    } else if (result is Failure<User>) {
      emit(UserLoggedOut(message: result.error.message));
    }
  }
}
