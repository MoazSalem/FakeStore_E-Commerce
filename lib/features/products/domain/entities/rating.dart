import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'rating.freezed.dart';

@freezed
abstract class Rating with _$Rating {
  const factory Rating({required double rate, required int count}) = _Rating;
}
