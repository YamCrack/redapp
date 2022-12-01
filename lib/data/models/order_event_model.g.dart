// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_event_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderEventModel _$OrderEventModelFromJson(Map<String, dynamic> json) =>
    OrderEventModel(
      json['id'] as String?,
      json['comment'] as String?,
      json['data'] as String?,
      json['id_order'] as String?,
      json['eventType'] as String?,
      json['status'] as String?,
      json['username'] as String?,
      json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$OrderEventModelToJson(OrderEventModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'comment': instance.comment,
      'data': instance.data,
      'id_order': instance.orderId,
      'eventType': instance.eventType,
      'status': instance.status,
      'username': instance.username,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };
