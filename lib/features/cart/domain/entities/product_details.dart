import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_details.freezed.dart';

@freezed
abstract class ProductDetails with _$ProductDetails {
  factory ProductDetails({required int productId, required int quantity}) =
      _ProductDetails;
}
