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
    this.deliveryCost = 0,
    this.paymentAmount = 0,
    this.subtotal = 0,
    this.discount = 0,
    this.total = 0,
    this.commission = 0,
    this.extra,
    this.tag,
    this.createdAt,
    this.updatedAt,
    this.items = const [],
    this.address,
    this.user,
    this.events,
    this.fulfiller,
    this.salesman,
    this.courier,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) => _$OrderModelFromJson(json);
  Map<String, dynamic> toJson() => _$OrderModelToJson(this);

  bool isNew() => id == null || id!.isEmpty;
  double itemsCount() => items.fold(0, (previousValue, element) => previousValue + element.quantity!);

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
  @JsonValue([])
  List<OrderItemModel> items = [];
  AddressModel? address;
  UserModel? user;
  List<OrderEventModel>? events;
  UserModel? fulfiller;
  UserModel? salesman;
  UserModel? courier;

  void recalculateTotals() {
    subtotal = items.fold(0, (previousValue, element) => previousValue! + element.amount!);
    total = subtotal! + deliveryCost! - discount! + commission!;
  }

  List<Map<String, dynamic>> getItemsApi() {
    return items
        .where(
          (element) => !element.toRemove,
        )
        .map((e) => e.toApi())
        .toList();
  }
}
