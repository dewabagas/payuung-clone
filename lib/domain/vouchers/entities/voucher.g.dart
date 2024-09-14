// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'voucher.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$VoucherImpl _$$VoucherImplFromJson(Map<String, dynamic> json) =>
    _$VoucherImpl(
      id: (json['id'] as num?)?.toInt(),
      voucherName: json['voucherName'] as String?,
      price: (json['price'] as num?)?.toDouble(),
      merchantName: json['merchantName'] as String?,
      imageUrl: json['imageUrl'] as String?,
    );

Map<String, dynamic> _$$VoucherImplToJson(_$VoucherImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'voucherName': instance.voucherName,
      'price': instance.price,
      'merchantName': instance.merchantName,
      'imageUrl': instance.imageUrl,
    };
