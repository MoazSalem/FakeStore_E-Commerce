import 'package:ecommerce/features/home_screen/domain/entities/product.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'cart.freezed.dart';

@freezed
abstract class Cart with _$Cart {
  const factory Cart({
    required int id,
    required int userId,
    required List<Product> products,
  }) = _Cart;
}
