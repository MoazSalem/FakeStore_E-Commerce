import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';

@freezed
abstract class User with _$User {
  factory User({
    required int id,
    required String name,
    required String? avatarUrl,
  }) = _User;
}
