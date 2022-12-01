// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductModel _$ProductModelFromJson(Map<String, dynamic> json) => ProductModel(
      id: json['id'] as String?,
      code: json['code'] as String?,
      title: json['title'] as String?,
      description: json['description'] as String?,
      handle: json['handle'] as String?,
      category: json['category'] as String?,
      brand: json['brand'] as String?,
      tags: json['tags'] as String?,
      status: json['status'] as String?,
      imageUrl: json['imageUrl'] as String?,
      prodType: json['prodType'] as String?,
      flags: json['flags'] as String?,
      idImage: json['id_image'] as String?,
      ordersCount: json['ordersCount'] as int?,
      lastOrderAt: json['lastOrderAt'] == null
          ? null
          : DateTime.parse(json['lastOrderAt'] as String),
      available: json['available'] as String?,
      inventoryPolicy: json['inventoryPolicy'] as String?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
      prices: (json['prices'] as List<dynamic>?)
          ?.map((e) => PriceModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      images: (json['images'] as List<dynamic>?)
          ?.map((e) => ImageModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ProductModelToJson(ProductModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'title': instance.title,
      'description': instance.description,
      'handle': instance.handle,
      'category': instance.category,
      'brand': instance.brand,
      'tags': instance.tags,
      'status': instance.status,
      'imageUrl': instance.imageUrl,
      'prodType': instance.prodType,
      'flags': instance.flags,
      'id_image': instance.idImage,
      'ordersCount': instance.ordersCount,
      'lastOrderAt': instance.lastOrderAt?.toIso8601String(),
      'available': instance.available,
      'inventoryPolicy': instance.inventoryPolicy,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'prices': instance.prices,
      'images': instance.images,
    };
