import 'package:ecommerce/features/cart/data/models/product_details_model.dart';
import 'package:ecommerce/features/cart/domain/entities/cart.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'cart_model.freezed.dart';
part 'cart_model.g.dart';

@freezed
abstract class CartModel with _$CartModel {
  const factory CartModel({
    required int id,
    required int userId,
    required List<ProductDetailsModel> products,
  }) = _CartModel;

  factory CartModel.fromJson(Map<String, dynamic> json) =>
      _$CartModelFromJson(json);
}

extension CartModelToEntity on CartModel {
  Cart toEntity() => Cart(
    id: id,
    userId: userId,
    productsDetails: products.map((product) => product.toEntity()).toList(),
  );
}
