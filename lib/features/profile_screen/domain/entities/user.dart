import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'user.freezed.dart';

@freezed
abstract class User with _$User {
  factory User({
    required int id,
    required String name,
    required String email,
    required String phone,
    required String avatarUrl,
  }) = _User;
}
