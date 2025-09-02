// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_details_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ProductDetailsModel _$ProductDetailsModelFromJson(Map<String, dynamic> json) =>
    _ProductDetailsModel(
      productId: (json['productId'] as num).toInt(),
      quantity: (json['quantity'] as num).toInt(),
    );

Map<String, dynamic> _$ProductDetailsModelToJson(
  _ProductDetailsModel instance,
) => <String, dynamic>{
  'productId': instance.productId,
  'quantity': instance.quantity,
};
