import 'package:ecommerce/features/cart_screen/domain/entities/cart.dart';
import 'package:ecommerce/features/home_screen/data/models/product_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'cart_model.freezed.dart';
part 'cart_model.g.dart';

@freezed
abstract class CartModel with _$CartModel {
  const factory CartModel({
    required int id,
    required int userId,
    required List<ProductModel> products,
  }) = _CartModel;

  factory CartModel.fromJson(Map<String, dynamic> json) =>
      _$CartModelFromJson(json);
}

extension CartModelToEntity on CartModel {
  Cart toEntity() => Cart(
    id: id,
    userId: userId,
    products: products.map((product) => product.toEntity()).toList(),
  );
}
