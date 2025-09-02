// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_details_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ProductDetailsModel implements DiagnosticableTreeMixin {

 int get productId; int get quantity;
/// Create a copy of ProductDetailsModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProductDetailsModelCopyWith<ProductDetailsModel> get copyWith => _$ProductDetailsModelCopyWithImpl<ProductDetailsModel>(this as ProductDetailsModel, _$identity);

  /// Serializes this ProductDetailsModel to a JSON map.
  Map<String, dynamic> toJson();

@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'ProductDetailsModel'))
    ..add(DiagnosticsProperty('productId', productId))..add(DiagnosticsProperty('quantity', quantity));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProductDetailsModel&&(identical(other.productId, productId) || other.productId == productId)&&(identical(other.quantity, quantity) || other.quantity == quantity));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,productId,quantity);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'ProductDetailsModel(productId: $productId, quantity: $quantity)';
}


}

/// @nodoc
abstract mixin class $ProductDetailsModelCopyWith<$Res>  {
  factory $ProductDetailsModelCopyWith(ProductDetailsModel value, $Res Function(ProductDetailsModel) _then) = _$ProductDetailsModelCopyWithImpl;
@useResult
$Res call({
 int productId, int quantity
});




}
/// @nodoc
class _$ProductDetailsModelCopyWithImpl<$Res>
    implements $ProductDetailsModelCopyWith<$Res> {
  _$ProductDetailsModelCopyWithImpl(this._self, this._then);

  final ProductDetailsModel _self;
  final $Res Function(ProductDetailsModel) _then;

/// Create a copy of ProductDetailsModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? productId = null,Object? quantity = null,}) {
  return _then(_self.copyWith(
productId: null == productId ? _self.productId : productId // ignore: cast_nullable_to_non_nullable
as int,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [ProductDetailsModel].
extension ProductDetailsModelPatterns on ProductDetailsModel {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProductDetailsModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProductDetailsModel() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProductDetailsModel value)  $default,){
final _that = this;
switch (_that) {
case _ProductDetailsModel():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProductDetailsModel value)?  $default,){
final _that = this;
switch (_that) {
case _ProductDetailsModel() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int productId,  int quantity)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProductDetailsModel() when $default != null:
return $default(_that.productId,_that.quantity);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int productId,  int quantity)  $default,) {final _that = this;
switch (_that) {
case _ProductDetailsModel():
return $default(_that.productId,_that.quantity);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int productId,  int quantity)?  $default,) {final _that = this;
switch (_that) {
case _ProductDetailsModel() when $default != null:
return $default(_that.productId,_that.quantity);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ProductDetailsModel with DiagnosticableTreeMixin implements ProductDetailsModel {
   _ProductDetailsModel({required this.productId, required this.quantity});
  factory _ProductDetailsModel.fromJson(Map<String, dynamic> json) => _$ProductDetailsModelFromJson(json);

@override final  int productId;
@override final  int quantity;

/// Create a copy of ProductDetailsModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProductDetailsModelCopyWith<_ProductDetailsModel> get copyWith => __$ProductDetailsModelCopyWithImpl<_ProductDetailsModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProductDetailsModelToJson(this, );
}
@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'ProductDetailsModel'))
    ..add(DiagnosticsProperty('productId', productId))..add(DiagnosticsProperty('quantity', quantity));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProductDetailsModel&&(identical(other.productId, productId) || other.productId == productId)&&(identical(other.quantity, quantity) || other.quantity == quantity));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,productId,quantity);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'ProductDetailsModel(productId: $productId, quantity: $quantity)';
}


}

/// @nodoc
abstract mixin class _$ProductDetailsModelCopyWith<$Res> implements $ProductDetailsModelCopyWith<$Res> {
  factory _$ProductDetailsModelCopyWith(_ProductDetailsModel value, $Res Function(_ProductDetailsModel) _then) = __$ProductDetailsModelCopyWithImpl;
@override @useResult
$Res call({
 int productId, int quantity
});




}
/// @nodoc
class __$ProductDetailsModelCopyWithImpl<$Res>
    implements _$ProductDetailsModelCopyWith<$Res> {
  __$ProductDetailsModelCopyWithImpl(this._self, this._then);

  final _ProductDetailsModel _self;
  final $Res Function(_ProductDetailsModel) _then;

/// Create a copy of ProductDetailsModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? productId = null,Object? quantity = null,}) {
  return _then(_ProductDetailsModel(
productId: null == productId ? _self.productId : productId // ignore: cast_nullable_to_non_nullable
as int,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
