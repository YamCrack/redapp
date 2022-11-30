import 'package:json_annotation/json_annotation.dart';

part 'price_model.g.dart';

@JsonSerializable()
class PriceModel {
  PriceModel(
      {this.id,
      this.code,
      this.idProduct,
      this.name,
      this.price,
      this.tag,
      this.createdAt,
      this.updatedAt});

  factory PriceModel.fromJson(Map<String, dynamic> json) =>
      _$PriceModelFromJson(json);

  Map<String, dynamic> toJson() => _$PriceModelToJson(this);

  String? id;
  String? code;
  String? idProduct;
  String? name;
  String? price;
  String? tag;
  DateTime? createdAt;
  DateTime? updatedAt;
}
