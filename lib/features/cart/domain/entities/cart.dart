import 'package:ecommerce/features/cart/domain/entities/product_details.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'cart.freezed.dart';

@freezed
abstract class Cart with _$Cart {
  const factory Cart({
    required int id,
    required int userId,
    required List<ProductDetails> productsDetails,
  }) = _Cart;
}
