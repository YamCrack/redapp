import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../config/constants.dart';
import '../../../../data/models/order_model.dart';
import '../../../../shared/utils/format_utils.dart';

class OrderListCard extends StatelessWidget {
  const OrderListCard({super.key, required this.order, this.onTap});

  final OrderModel order;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return buildCard(context);
  }

  Widget buildCard(BuildContext context) {
    return GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: onTap,
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                const Padding(
                  padding: EdgeInsets.only(right: 16.0),
                  child: CircleAvatar(
                    maxRadius: 24,
                    child: Icon(Icons.person), // NetworkImage(user.picture.thumbnail),
                  ),
                ),
                Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      '${order.user?.firstName}',
                      style: const TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                      maxLines: 1,
                      softWrap: false,
                      overflow: TextOverflow.fade,
                    ),
                    Text(
                      '${order.code} - ${order.address?.city ?? order.address?.state ?? 'N/A'}',
                    ),
                    Text(
                      '${formatNumber(order.itemsCount())} Artículos - ${order.user?.phone ?? order.username}',
                      style: const TextStyle(fontSize: 10.0),
                    )
                  ],
                )),
                const SizedBox(width: 8.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        // const Text(
                        //   r'$ ',
                        //   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 10.0),
                        // ),
                        Text(
                          formatCurrency(order.total),
                          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0, color: kPrimaryColor),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Text(DateFormat.jm().format(order.createdAt!),
                          textAlign: TextAlign.end, style: const TextStyle(fontSize: 12, color: Colors.grey)),
                    )
                  ],
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.only(left: 64.0),
              child: Divider(),
            )
          ],
        ));
  }
}
