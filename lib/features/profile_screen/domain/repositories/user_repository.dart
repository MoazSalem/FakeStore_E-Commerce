import 'package:ecommerce/core/error_handling/result.dart';
import 'package:ecommerce/features/profile_screen/data/models/user_model.dart';
import 'package:ecommerce/features/profile_screen/domain/entities/user.dart';

abstract class UserRepository {
  Future<Result<User>> getUser(String name);
  Future<Result<User>> login(String name);
  Future<Result> register(UserModel user);
  Future<Result> logout();
  Future<Result<User>> checkUser();
}
