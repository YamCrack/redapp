import 'package:json_annotation/json_annotation.dart';

import '../../shared/api/constants/endpoints.dart';
import '../../shared/utils/json_utils.dart';

part 'order_item_model.g.dart';

@JsonSerializable()
class OrderItemModel {
  OrderItemModel(
      {this.id,
      this.code,
      this.idOrder,
      this.idProduct,
      this.name,
      this.imageUrl,
      this.price,
      this.quantity,
      this.amount,
      this.fulfilledQty,
      this.createdAt,
      this.updatedAt});

  factory OrderItemModel.fromJson(Map<String, dynamic> json) => _$OrderItemModelFromJson(json);
  Map<String, dynamic> toJson() => _$OrderItemModelToJson(this);

  String? id;
  String? code;
  @JsonKey(name: 'id_order')
  String? idOrder;
  @JsonKey(name: 'id_product')
  String? idProduct;
  String? name;
  String? imageUrl;
  @JsonKey(toJson: toNumber, fromJson: fromNumber)
  double? price;
  @JsonKey(toJson: toNumber, fromJson: fromNumber)
  double? quantity;
  @JsonKey(toJson: toNumber, fromJson: fromNumber)
  double? amount;
  double? fulfilledQty;
  String? createdAt;
  String? updatedAt;

  String getImage() {
    if (imageUrl != null && imageUrl!.isNotEmpty) {
      return Endpoints.imagesUrl + imageUrl!;
    }

    return '';
  }
}
