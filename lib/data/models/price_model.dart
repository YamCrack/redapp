import 'package:json_annotation/json_annotation.dart';

import '../../shared/utils/json_utils.dart';

part 'price_model.g.dart';

@JsonSerializable()
class PriceModel {
  PriceModel({this.id, this.code, this.idProduct, this.name, this.price, this.tag, this.createdAt, this.updatedAt});

  factory PriceModel.fromJson(Map<String, dynamic> json) => _$PriceModelFromJson(json);

  Map<String, dynamic> toJson() => _$PriceModelToJson(this);

  bool get isDefault => code == 'default';

  String? id;
  String? code;
  @JsonKey(name: 'id_product')
  String? idProduct;
  String? name;
  @JsonKey(name: 'price', toJson: toNumber, fromJson: fromNumber)
  double? price;
  String? tag;
  DateTime? createdAt;
  DateTime? updatedAt;
}
