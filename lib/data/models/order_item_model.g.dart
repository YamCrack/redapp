// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderItemModel _$OrderItemModelFromJson(Map<String, dynamic> json) =>
    OrderItemModel(
      id: json['id'] as String?,
      code: json['code'] as String?,
      idOrder: json['id_order'] as String?,
      idProduct: json['id_product'] as String?,
      name: json['name'] as String?,
      imageUrl: json['imageUrl'] as String?,
      price: fromNumber(json['price'] as String?),
      quantity: fromNumber(json['quantity'] as String?),
      amount: fromNumber(json['amount'] as String?),
      fulfilledQty: (json['fulfilledQty'] as num?)?.toDouble(),
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
    );

Map<String, dynamic> _$OrderItemModelToJson(OrderItemModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'id_order': instance.idOrder,
      'id_product': instance.idProduct,
      'name': instance.name,
      'imageUrl': instance.imageUrl,
      'price': toNumber(instance.price),
      'quantity': toNumber(instance.quantity),
      'amount': toNumber(instance.amount),
      'fulfilledQty': instance.fulfilledQty,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };
