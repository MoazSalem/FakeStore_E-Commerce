import 'package:ecommerce/features/cart/domain/entities/product_details.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_details_model.freezed.dart';
part 'product_details_model.g.dart';

@freezed
abstract class ProductDetailsModel with _$ProductDetailsModel {
  factory ProductDetailsModel({required int productId, required int quantity}) =
      _ProductDetailsModel;

  factory ProductDetailsModel.fromJson(Map<String, dynamic> json) =>
      _$ProductDetailsModelFromJson(json);
}

extension ProductDetailsModelExtension on ProductDetailsModel {
  ProductDetails toEntity() =>
      ProductDetails(productId: productId, quantity: quantity);
}
