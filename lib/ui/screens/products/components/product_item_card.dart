import 'package:flutter/material.dart';

import '../../../../config/constants.dart';
import '../../../../data/models/product_model.dart';
import '../../../../shared/utils/format_utils.dart';
import '../../../widgets/network_image.dart';

class ProductItemCard extends StatelessWidget {
  const ProductItemCard({
    super.key,
    required this.product,
    this.onTap,
  });

  final ProductModel product;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: Row(
          children: [
            SizedBox(
              width: 88,
              child: AspectRatio(
                aspectRatio: 0.88,
                child: Container(
                  padding: const EdgeInsets.all(10), // getProportionateScreenWidth(10)),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF5F6F9),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: SafeNetworkImage(
                      imageUrl: product.getImage()), // Container() // Image.asset(orderItem.product.images[0]),
                ),
              ),
            ),
            const SizedBox(width: 20),
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.title!,
                  style: const TextStyle(color: Colors.black, fontSize: 14),
                  softWrap: true,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
                Text(
                  '${product.code} - ${product.category} - ${product.brand}',
                  style: const TextStyle(color: kTextColor, fontSize: 12),
                  softWrap: true,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
                const SizedBox(height: 10),
                Text.rich(
                  TextSpan(
                    text: formatCurrency(product.defaultPrice?.price),
                    style: const TextStyle(fontWeight: FontWeight.w600, color: kPrimaryColor),
                    children: [
                      TextSpan(
                          text: '  (${formatNumber(product.available)} disponibles)',
                          style: const TextStyle(color: kTextColor)), //Theme.of(context).textTheme.bodyText1),
                    ],
                  ),
                )
              ],
            )),
          ],
        ));
  }
}
