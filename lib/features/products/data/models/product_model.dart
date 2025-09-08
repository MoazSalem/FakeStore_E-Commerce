import 'package:ecommerce/core/utils/helper_functions.dart';
import 'package:ecommerce/features/products/data/models/rating_model.dart';
import 'package:ecommerce/features/products/domain/entities/product.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_model.freezed.dart';
part 'product_model.g.dart';

@freezed
abstract class ProductModel with _$ProductModel {
  const factory ProductModel({
    required int id,
    required String title,
    required double price,
    required String description,
    required String category,
    required String image,
    required RatingModel rating,
  }) = _ProductModel;

  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);
}

extension ProductModelToEntity on ProductModel {
  Product toEntity() => Product(
    id: id,
    title: title,
    price: price,
    description: description,
    category: HelperFunctions.capitalizeWords(category),
    image: image,
    rating: rating.toEntity(),
  );
}
