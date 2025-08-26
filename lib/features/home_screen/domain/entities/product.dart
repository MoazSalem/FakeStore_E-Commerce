import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'product.freezed.dart';

@freezed
abstract class Product with _$Product {
  const factory Product({
    required int id,
    required String title,
    required double price,
    required String description,
    required String category,
    required String image,
  }) = _Product;
}
