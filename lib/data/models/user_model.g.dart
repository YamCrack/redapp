// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      id: json['id'] as String?,
      code: json['code'] as String?,
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      email: json['email'] as String?,
      role: json['role'] as String?,
      status: json['status'] as String?,
      phone: json['phone'] as String?,
      taxId: json['taxId'] as String?,
      signedFrom: json['signedFrom'] as String?,
      lastPurchaseAt: json['lastPurchaseAt'] as String?,
      countPurchases: json['countPurchases'] as String?,
      lastLoginAt: json['lastLoginAt'] as String?,
      defaultPrice: json['defaultPrice'] as String?,
    );

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'email': instance.email,
      'role': instance.role,
      'status': instance.status,
      'phone': instance.phone,
      'taxId': instance.taxId,
      'signedFrom': instance.signedFrom,
      'lastPurchaseAt': instance.lastPurchaseAt,
      'countPurchases': instance.countPurchases,
      'lastLoginAt': instance.lastLoginAt,
      'defaultPrice': instance.defaultPrice,
    };
