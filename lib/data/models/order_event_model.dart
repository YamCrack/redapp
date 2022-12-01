import 'package:json_annotation/json_annotation.dart';

part 'order_event_model.g.dart';

@JsonSerializable()
class OrderEventModel {
  OrderEventModel(
    this.id,
    this.comment,
    this.data,
    this.orderId,
    this.eventType,
    this.status,
    this.username,
    this.createdAt,
    this.updatedAt,
  );

  factory OrderEventModel.fromJson(Map<String, dynamic> json) => _$OrderEventModelFromJson(json);
  Map<String, dynamic> toJson() => _$OrderEventModelToJson(this);

  String? id;
  String? comment;
  String? data;
  @JsonKey(name: 'id_order')
  String? orderId;
  String? eventType;
  String? status;
  String? username;
  DateTime? createdAt;
  DateTime? updatedAt;
}
