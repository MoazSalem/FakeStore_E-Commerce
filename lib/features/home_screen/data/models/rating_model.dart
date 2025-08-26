import 'package:ecommerce/features/home_screen/domain/entities/rating.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'rating_model.freezed.dart';
part 'rating_model.g.dart';

@freezed
abstract class RatingModel with _$RatingModel {
  const factory RatingModel({required double rate, required int count}) =
      _RatingModel;

  factory RatingModel.fromJson(Map<String, dynamic> json) =>
      _$RatingModelFromJson(json);
}

// Mapper to entity
extension RatingModelToEntity on RatingModel {
  Rating toEntity() => Rating(rate: rate, count: count);
}
