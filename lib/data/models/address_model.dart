import 'package:json_annotation/json_annotation.dart';

part 'address_model.g.dart';

@JsonSerializable()
class AddressModel {
  AddressModel(
      {this.id,
      this.code,
      this.alias,
      this.addressLine,
      this.addressLine2,
      this.city,
      this.state,
      this.zip,
      this.country,
      this.street,
      this.streetNumber,
      this.streetNumberSuffix,
      this.streetNumberPrefix,
      this.receptor,
      this.primary,
      this.createdAt,
      this.updatedAt});

  factory AddressModel.fromJson(Map<String, dynamic> json) => _$AddressModelFromJson(json);
  Map<String, dynamic> toJson() => _$AddressModelToJson(this);

  String? id;
  String? code;
  String? alias;
  String? addressLine;
  String? addressLine2;
  String? city;
  String? state;
  String? zip;
  String? country;
  String? street;
  String? streetNumber;
  String? streetNumberSuffix;
  String? streetNumberPrefix;
  String? receptor;
  bool? primary;
  DateTime? createdAt;
  DateTime? updatedAt;
}
