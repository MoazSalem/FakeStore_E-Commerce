import 'package:ecommerce/features/user/domain/entities/user.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
abstract class UserModel with _$UserModel {
  factory UserModel({
    required int id,
    required String name,
    required String? avatarUrl,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}

extension UserModelToEntity on UserModel {
  User toEntity() => User(id: id, name: name, avatarUrl: avatarUrl);
}
