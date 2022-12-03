import 'package:json_annotation/json_annotation.dart';

import '../../shared/api/constants/endpoints.dart';
import '../../shared/utils/json_utils.dart';
import 'price_model.dart';
import 'product_model.dart';

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
      this.priceId,
      this.toRemove = false,
      this.createdAt,
      this.updatedAt});

  factory OrderItemModel.fromJson(Map<String, dynamic> json) => _$OrderItemModelFromJson(json);
  factory OrderItemModel.fromProduct(ProductModel product) {
    final PriceModel price = product.defaultPrice ?? PriceModel();

    return OrderItemModel(
        idProduct: product.id,
        code: product.code,
        name: product.title,
        imageUrl: product.imageUrl,
        price: price.price,
        quantity: 1,
        amount: price.price,
        fulfilledQty: 0,
        priceId: price.id);
  }

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
  String? priceId;
  bool toRemove;

  String getImage() {
    if (imageUrl != null && imageUrl!.isNotEmpty) {
      return Endpoints.imagesUrl + imageUrl!;
    }

    return '';
  }

  Map<String, dynamic> toApi() {
    return {
      'id': id,
      'prodId': idProduct,
      'quantity': quantity,
      'fulfilledQty': fulfilledQty,
      'priceId': priceId,
    };

    // 'prodId', 'quantity', 'priceId', 'fulfilledQty'
  }

  void recalculateTotals() {
    amount = price! * quantity!;
  }
}
