import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import '../../data/models/order_item_model.dart';

class OrderItemCard extends StatelessWidget {
  OrderItemCard({super.key, required this.orderItem, this.onTap});

  final OrderItemModel orderItem;
  final VoidCallback? onTap;
  final _formatCurrency = NumberFormat.simpleCurrency();

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
                orderItem.name!,
                style: Theme.of(context).textTheme.titleMedium!.apply(fontWeightDelta: 2, fontSizeFactor: 0.9),
              ),
            ],
          ),
          subtitle: Padding(
              padding: const EdgeInsets.only(left: 36),
              child: Text(
                _formatCurrency.format(orderItem.price),
                style: Theme.of(context).textTheme.bodyMedium!.apply(fontSizeFactor: 0.9),
              )),
        ));
  }
}
