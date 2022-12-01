// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderModel _$OrderModelFromJson(Map<String, dynamic> json) => OrderModel(
      id: json['id'] as String?,
      idUser: json['id_user'] as String?,
      idAddress: json['id_address'] as String?,
      idFulfiller: json['id_fulfiller'] as String?,
      idSalesman: json['id_salesman'] as String?,
      idCourier: json['id_courier'] as String?,
      fulfilledBy: json['fulfilledBy'] as String?,
      username: json['username'] as String?,
      createdBy: json['createdBy'] as String?,
      status: json['status'] as String?,
      notes: json['notes'] as String?,
      code: json['code'] as String?,
      serial: json['serial'] as String?,
      folio: json['folio'] as int?,
      paymentStatus: json['paymentStatus'] as String?,
      paymentMethod: json['paymentMethod'] as String?,
      paymentDate: json['paymentDate'] as String?,
      idDeliveryMethod: json['id_deliveryMethod'] as String?,
      deliveryMethod: json['deliveryMethod'] as String?,
      deliveryDate: json['deliveryDate'] as String?,
      deliveryCost: fromNumber(json['deliveryCost'] as String?),
      paymentAmount: fromNumber(json['paymentAmount'] as String?),
      subtotal: fromNumber(json['subtotal'] as String?),
      discount: fromNumber(json['discount'] as String?),
      total: fromNumber(json['total'] as String?),
      commission: fromNumber(json['commission'] as String?),
      extra: json['extra'] as String?,
      tag: json['tag'] as String?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      items: (json['items'] as List<dynamic>?)
          ?.map((e) => OrderItemModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      address: json['address'] == null
          ? null
          : AddressModel.fromJson(json['address'] as Map<String, dynamic>),
      user: json['user'] == null
          ? null
          : UserModel.fromJson(json['user'] as Map<String, dynamic>),
      events: (json['events'] as List<dynamic>?)
          ?.map((e) => OrderEventModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      fulfiller: json['fulfiller'] == null
          ? null
          : UserModel.fromJson(json['fulfiller'] as Map<String, dynamic>),
      salesman: json['salesman'] == null
          ? null
          : UserModel.fromJson(json['salesman'] as Map<String, dynamic>),
      courier: json['courier'] == null
          ? null
          : UserModel.fromJson(json['courier'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$OrderModelToJson(OrderModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'id_user': instance.idUser,
      'id_address': instance.idAddress,
      'id_fulfiller': instance.idFulfiller,
      'id_salesman': instance.idSalesman,
      'id_courier': instance.idCourier,
      'fulfilledBy': instance.fulfilledBy,
      'username': instance.username,
      'createdBy': instance.createdBy,
      'status': instance.status,
      'notes': instance.notes,
      'code': instance.code,
      'serial': instance.serial,
      'folio': instance.folio,
      'paymentStatus': instance.paymentStatus,
      'paymentMethod': instance.paymentMethod,
      'paymentDate': instance.paymentDate,
      'id_deliveryMethod': instance.idDeliveryMethod,
      'deliveryMethod': instance.deliveryMethod,
      'deliveryDate': instance.deliveryDate,
      'deliveryCost': toNumber(instance.deliveryCost),
      'paymentAmount': toNumber(instance.paymentAmount),
      'subtotal': toNumber(instance.subtotal),
      'discount': toNumber(instance.discount),
      'total': toNumber(instance.total),
      'commission': toNumber(instance.commission),
      'extra': instance.extra,
      'tag': instance.tag,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'items': instance.items,
      'address': instance.address,
      'user': instance.user,
      'events': instance.events,
      'fulfiller': instance.fulfiller,
      'salesman': instance.salesman,
      'courier': instance.courier,
    };
