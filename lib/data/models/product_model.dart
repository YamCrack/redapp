import '../../shared/api/constants/endpoints.dart';
import '../../shared/utils/json_utils.dart';
import 'image_model.dart';
import 'price_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'product_model.g.dart';

@JsonSerializable()
class ProductModel {
  ProductModel(
      {this.id,
      this.code,
      this.title,
      this.description,
      this.handle,
      this.category,
      this.brand,
      this.tags,
      this.status,
      this.imageUrl,
      this.prodType,
      this.flags,
      this.idImage,
      this.ordersCount,
      this.lastOrderAt,
      this.available,
      this.inventoryPolicy,
      this.createdAt,
      this.updatedAt,
      this.prices,
      this.images});

  factory ProductModel.fromJson(Map<String, dynamic> json) => _$ProductModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProductModelToJson(this);

  PriceModel? get defaultPrice {
    if (prices != null && prices!.isNotEmpty) {
      final PriceModel price = prices!.firstWhere((PriceModel price) => price.isDefault, orElse: () => prices!.first);
      return price;
    }

    return null;
  }

  String getImage() {
    if (imageUrl != null && imageUrl!.isNotEmpty) {
      return Endpoints.imagesUrl + imageUrl!;
    }

    return '';
  }

  String? id;
  String? code;
  String? title;
  String? description;
  String? handle;
  String? category;
  String? brand;
  String? tags;
  String? status;
  @JsonKey(name: 'image_url')
  String? imageUrl;
  String? prodType;
  String? flags;
  @JsonKey(name: 'id_image')
  String? idImage;
  int? ordersCount;
  DateTime? lastOrderAt;

  @JsonKey(name: 'available', toJson: toNumber, fromJson: fromNumber)
  double? available;
  String? inventoryPolicy;
  String? createdAt;
  String? updatedAt;
  List<PriceModel>? prices;
  List<ImageModel>? images;
}
