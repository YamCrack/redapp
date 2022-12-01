import 'package:json_annotation/json_annotation.dart';
import '../../shared/utils/json_utils.dart';
import 'address_model.dart';
import 'order_event_model.dart';
import 'order_item_model.dart';
import 'user_model.dart';

part 'order_model.g.dart';

@JsonSerializable()
class OrderModel {
  OrderModel({
    this.id,
    this.idUser,
    this.idAddress,
    this.idFulfiller,
    this.idSalesman,
    this.idCourier,
    this.fulfilledBy,
    this.username,
    this.createdBy,
    this.status,
    this.notes,
    this.code,
    this.serial,
    this.folio,
    this.paymentStatus,
    this.paymentMethod,
    this.paymentDate,
    this.idDeliveryMethod,
    this.deliveryMethod,
    this.deliveryDate,
    this.deliveryCost,
    this.paymentAmount,
    this.subtotal,
    this.discount,
    this.total,
    this.commission,
    this.extra,
    this.tag,
    this.createdAt,
    this.updatedAt,
    this.items,
    this.address,
    this.user,
    this.events,
    this.fulfiller,
    this.salesman,
    this.courier,
  });

  String? id;
  @JsonKey(name: 'id_user')
  String? idUser;
  @JsonKey(name: 'id_address')
  String? idAddress;
  @JsonKey(name: 'id_fulfiller')
  String? idFulfiller;
  @JsonKey(name: 'id_salesman')
  String? idSalesman;
  @JsonKey(name: 'id_courier')
  String? idCourier;
  String? fulfilledBy;
  String? username;
  String? createdBy;
  String? status;
  String? notes;
  String? code;
  String? serial;
  int? folio;
  String? paymentStatus;
  String? paymentMethod;
  String? paymentDate;
  @JsonKey(name: 'id_deliveryMethod')
  String? idDeliveryMethod;
  String? deliveryMethod;
  String? deliveryDate;
  @JsonKey(toJson: toNumber, fromJson: fromNumber)
  double? deliveryCost;
  @JsonKey(toJson: toNumber, fromJson: fromNumber)
  double? paymentAmount;
  @JsonKey(toJson: toNumber, fromJson: fromNumber)
  double? subtotal;
  @JsonKey(toJson: toNumber, fromJson: fromNumber)
  double? discount;
  @JsonKey(toJson: toNumber, fromJson: fromNumber)
  double? total;
  @JsonKey(toJson: toNumber, fromJson: fromNumber)
  double? commission;
  String? extra;
  String? tag;
  DateTime? createdAt;
  DateTime? updatedAt;
  List<OrderItemModel>? items;
  AddressModel? address;
  UserModel? user;
  List<OrderEventModel>? events;
  UserModel? fulfiller;
  UserModel? salesman;
  UserModel? courier;

  factory OrderModel.fromJson(Map<String, dynamic> json) => _$OrderModelFromJson(json);
  Map<String, dynamic> toJson() => _$OrderModelToJson(this);
}
