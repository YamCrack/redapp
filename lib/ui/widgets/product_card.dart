import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../data/models/product_model.dart';
import '../../data/models/user_model.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key, this.product, this.onTap});

  final ProductModel? product;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 2,
        shadowColor: Theme.of(context).colorScheme.shadow,
        color: Theme.of(context).colorScheme.surface,
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(12))),
        child: ListTile(
          onTap: onTap,
          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(12))),
          trailing: Icon(Ionicons.search_circle_outline, color: Theme.of(context).textTheme.titleMedium!.color),
          title: Row(
            children: <Widget>[
              Icon(Ionicons.person_circle, color: Theme.of(context).colorScheme.primary),
              const SizedBox(width: 12),
              Text(
                'Producto de prueba',
                style: Theme.of(context).textTheme.titleMedium!.apply(fontWeightDelta: 2, fontSizeFactor: 0.9),
              ),
            ],
          ),
          subtitle: Padding(
              padding: const EdgeInsets.only(left: 36),
              child: Text(
                r'$55.22',
                style: Theme.of(context).textTheme.bodyMedium!.apply(fontSizeFactor: 0.9),
              )),
        ));
  }
}
