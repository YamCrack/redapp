import 'package:json_annotation/json_annotation.dart';

import 'product_model.dart';

part 'product_response_model.g.dart';

@JsonSerializable()
class ProductResponse {
  ProductResponse({this.success, this.product, this.products});

  factory ProductResponse.fromJson(Map<String, dynamic> json) =>
      _$ProductResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ProductResponseToJson(this);

  bool? success;
  ProductModel? product;
  List<ProductModel>? products;
}
