import 'package:ecommerce/features/profile_screen/data/models/user_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ecommerce/core/error_handling/result.dart';
import 'package:ecommerce/features/profile_screen/domain/entities/user.dart';
import 'package:ecommerce/features/profile_screen/domain/repositories/user_repository.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter/foundation.dart';

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
    if (result is Success<User>) {
      emit(UserLoggedOut(message: "Successfully logged out"));
    } else if (result is Failure<User>) {
      emit(UserLoggedOut(message: result.error.message));
    }
  }

  void signIn() async {
    // get user from repository
    final result = await GetIt.I<UserRepository>().login();
    if (result is Success<User>) {
      emit(UserLoaded(user: result.data));
    } else if (result is Failure<User>) {
      emit(UserLoggedOut(message: result.error.message));
    }
  }
}
