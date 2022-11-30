// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'price_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PriceModel _$PriceModelFromJson(Map<String, dynamic> json) => PriceModel(
      id: json['id'] as String?,
      code: json['code'] as String?,
      idProduct: json['idProduct'] as String?,
      name: json['name'] as String?,
      price: json['price'] as String?,
      tag: json['tag'] as String?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$PriceModelToJson(PriceModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'idProduct': instance.idProduct,
      'name': instance.name,
      'price': instance.price,
      'tag': instance.tag,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };
