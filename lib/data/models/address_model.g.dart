// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddressModel _$AddressModelFromJson(Map<String, dynamic> json) => AddressModel(
      id: json['id'] as String?,
      code: json['code'] as String?,
      alias: json['alias'] as String?,
      addressLine: json['addressLine'] as String?,
      addressLine2: json['addressLine2'] as String?,
      city: json['city'] as String?,
      state: json['state'] as String?,
      zip: json['zip'] as String?,
      country: json['country'] as String?,
      street: json['street'] as String?,
      streetNumber: json['streetNumber'] as String?,
      streetNumberSuffix: json['streetNumberSuffix'] as String?,
      streetNumberPrefix: json['streetNumberPrefix'] as String?,
      receptor: json['receptor'] as String?,
      primary: json['primary'] as bool?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$AddressModelToJson(AddressModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'alias': instance.alias,
      'addressLine': instance.addressLine,
      'addressLine2': instance.addressLine2,
      'city': instance.city,
      'state': instance.state,
      'zip': instance.zip,
      'country': instance.country,
      'street': instance.street,
      'streetNumber': instance.streetNumber,
      'streetNumberSuffix': instance.streetNumberSuffix,
      'streetNumberPrefix': instance.streetNumberPrefix,
      'receptor': instance.receptor,
      'primary': instance.primary,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };
