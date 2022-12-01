import 'package:json_annotation/json_annotation.dart';

import 'order_model.dart';

part 'order_response_model.g.dart';

@JsonSerializable()
class OrderResponseModel {
  OrderResponseModel({this.success, this.order});

  factory OrderResponseModel.fromJson(Map<String, dynamic> json) => _$OrderResponseModelFromJson(json);
  Map<String, dynamic> toJson() => _$OrderResponseModelToJson(this);

  bool? success;
  OrderModel? order;
}
