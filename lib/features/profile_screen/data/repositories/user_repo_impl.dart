import 'dart:convert';
import 'package:ecommerce/core/error_handling/error_handling.dart';
import 'package:get_it/get_it.dart';
import 'package:ecommerce/core/error_handling/result.dart';
import 'package:ecommerce/features/profile_screen/data/models/user_model.dart';
import 'package:ecommerce/features/profile_screen/domain/entities/user.dart';
import 'package:ecommerce/features/profile_screen/domain/repositories/user_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserRepoImpl implements UserRepository {
  @override
  Future<Result<User>> getUser(String name) async {
    // user should be fetched from api, but because we are using a mock api it will be fetched from shared preferences
    // get user from shared preferences
    final userJson = GetIt.I.get<SharedPreferences>().getString(name);
    if (userJson != null) {
      return Success(UserModel.fromJson(jsonDecode(userJson)).toEntity());
    } else {
      return Failure(ErrorException('User not found', statusCode: 404));
    }
  }

  @override
  Future<Result<User>> login(String name) async {
    // fake login
    final result = await getUser(name);
    if (result is Success<User>) {
      // save token to shared preferences, in a real app this should be saved in a secure storage
      GetIt.I.get<SharedPreferences>().setString('token', 'fake_token');
      GetIt.I.get<SharedPreferences>().setString('user', result.data.name);
      return Success(result.data);
    } else {
      return Failure(ErrorException('User not found', statusCode: 404));
    }
  }

  @override
  Future<Result> logout() async {
    // fake logout, remove token from shared preferences
    try {
      GetIt.I.get<SharedPreferences>().remove('token');
      GetIt.I.get<SharedPreferences>().remove('user');
      return Success(null);
    } catch (e) {
      return Failure(ErrorException('Failed to logout', statusCode: 500));
    }
  }

  @override
  Future<Result> register(UserModel user) async {
    // fake register, save user to shared preferences
    try {
      GetIt.I.get<SharedPreferences>().setString('user', user.name);
      GetIt.I.get<SharedPreferences>().setString(
        user.name,
        jsonEncode(user.toJson()),
      );
      return Success(null);
    } catch (e) {
      return Failure(ErrorException('User not registered', statusCode: 500));
    }
  }

  @override
  Future<Result<User>> checkUser() async {
    // get token from repository
    final token = GetIt.I.get<SharedPreferences>().getString('token') ?? '';
    if (token.isEmpty) {
      return Failure(ErrorException('User not found', statusCode: 404));
    } else {
      final name = GetIt.I.get<SharedPreferences>().getString('user') ?? '';
      final result = await login(name);
      if (result is Success<User>) {
        return Success(result.data);
      } else {
        return Failure(ErrorException('User not found', statusCode: 404));
      }
    }
  }
}
