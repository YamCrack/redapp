import 'package:json_annotation/json_annotation.dart';

part 'image_model.g.dart';

@JsonSerializable()
class ImageModel {
  ImageModel(
      {this.id, this.code, this.idProduct, this.name, this.image, this.position, this.createdAt, this.updatedAt});

  factory ImageModel.fromJson(Map<String, dynamic> json) => _$ImageModelFromJson(json);

  Map<String, dynamic> toJson() => _$ImageModelToJson(this);

  String? id;
  String? code;
  @JsonKey(name: 'id_product')
  String? idProduct;
  String? name;
  String? image;
  int? position;
  DateTime? createdAt;
  DateTime? updatedAt;
}
