// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'voucher.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Voucher _$VoucherFromJson(Map<String, dynamic> json) {
  return _Voucher.fromJson(json);
}

/// @nodoc
mixin _$Voucher {
  int? get id => throw _privateConstructorUsedError;
  String? get voucherName => throw _privateConstructorUsedError;
  double? get price => throw _privateConstructorUsedError;
  String? get merchantName => throw _privateConstructorUsedError;
  String? get imageUrl => throw _privateConstructorUsedError;

  /// Serializes this Voucher to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Voucher
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $VoucherCopyWith<Voucher> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VoucherCopyWith<$Res> {
  factory $VoucherCopyWith(Voucher value, $Res Function(Voucher) then) =
      _$VoucherCopyWithImpl<$Res, Voucher>;
  @useResult
  $Res call(
      {int? id,
      String? voucherName,
      double? price,
      String? merchantName,
      String? imageUrl});
}

/// @nodoc
class _$VoucherCopyWithImpl<$Res, $Val extends Voucher>
    implements $VoucherCopyWith<$Res> {
  _$VoucherCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Voucher
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? voucherName = freezed,
    Object? price = freezed,
    Object? merchantName = freezed,
    Object? imageUrl = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      voucherName: freezed == voucherName
          ? _value.voucherName
          : voucherName // ignore: cast_nullable_to_non_nullable
              as String?,
      price: freezed == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double?,
      merchantName: freezed == merchantName
          ? _value.merchantName
          : merchantName // ignore: cast_nullable_to_non_nullable
              as String?,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$VoucherImplCopyWith<$Res> implements $VoucherCopyWith<$Res> {
  factory _$$VoucherImplCopyWith(
          _$VoucherImpl value, $Res Function(_$VoucherImpl) then) =
      __$$VoucherImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      String? voucherName,
      double? price,
      String? merchantName,
      String? imageUrl});
}

/// @nodoc
class __$$VoucherImplCopyWithImpl<$Res>
    extends _$VoucherCopyWithImpl<$Res, _$VoucherImpl>
    implements _$$VoucherImplCopyWith<$Res> {
  __$$VoucherImplCopyWithImpl(
      _$VoucherImpl _value, $Res Function(_$VoucherImpl) _then)
      : super(_value, _then);

  /// Create a copy of Voucher
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? voucherName = freezed,
    Object? price = freezed,
    Object? merchantName = freezed,
    Object? imageUrl = freezed,
  }) {
    return _then(_$VoucherImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      voucherName: freezed == voucherName
          ? _value.voucherName
          : voucherName // ignore: cast_nullable_to_non_nullable
              as String?,
      price: freezed == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double?,
      merchantName: freezed == merchantName
          ? _value.merchantName
          : merchantName // ignore: cast_nullable_to_non_nullable
              as String?,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$VoucherImpl implements _Voucher {
  _$VoucherImpl(
      {this.id,
      this.voucherName,
      this.price,
      this.merchantName,
      this.imageUrl});

  factory _$VoucherImpl.fromJson(Map<String, dynamic> json) =>
      _$$VoucherImplFromJson(json);

  @override
  final int? id;
  @override
  final String? voucherName;
  @override
  final double? price;
  @override
  final String? merchantName;
  @override
  final String? imageUrl;

  @override
  String toString() {
    return 'Voucher(id: $id, voucherName: $voucherName, price: $price, merchantName: $merchantName, imageUrl: $imageUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VoucherImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.voucherName, voucherName) ||
                other.voucherName == voucherName) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.merchantName, merchantName) ||
                other.merchantName == merchantName) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, voucherName, price, merchantName, imageUrl);

  /// Create a copy of Voucher
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$VoucherImplCopyWith<_$VoucherImpl> get copyWith =>
      __$$VoucherImplCopyWithImpl<_$VoucherImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VoucherImplToJson(
      this,
    );
  }
}

abstract class _Voucher implements Voucher {
  factory _Voucher(
      {final int? id,
      final String? voucherName,
      final double? price,
      final String? merchantName,
      final String? imageUrl}) = _$VoucherImpl;

  factory _Voucher.fromJson(Map<String, dynamic> json) = _$VoucherImpl.fromJson;

  @override
  int? get id;
  @override
  String? get voucherName;
  @override
  double? get price;
  @override
  String? get merchantName;
  @override
  String? get imageUrl;

  /// Create a copy of Voucher
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VoucherImplCopyWith<_$VoucherImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
