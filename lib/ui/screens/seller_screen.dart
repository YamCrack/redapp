import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

import '../widgets/header.dart';
import '../widgets/grid_item.dart';
import '../widgets/second_screen/link_card.dart';
import '../widgets/second_screen/text_divider.dart';
import 'new_order_screen.dart';
import 'second_screen.dart';

class SellerScreen extends StatelessWidget {
  const SellerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Theme.of(context).colorScheme.background,
      child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          physics: const BouncingScrollPhysics(),
          children: <Widget>[
            const Header(text: 'seller_mode'),
            const TextDivider(text: 'vendor_divide_title'),
            GridView.count(
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              childAspectRatio: 2 / 1.15,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              children: <GridItem>[
                GridItem(
                  title: 'new_order',
                  icon: Ionicons.add_circle,
                  // url: Uri.parse('https://www.instagram.com/anfeichtinger'),
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (routeContext) => const NewOrderScreen(),
                    ));
                  },
                ),
                GridItem(
                  title: 'orders_overview',
                  icon: Ionicons.bag_check,
                  url: Uri.parse('https://twitter.com/_pharrax'),
                ),
                // GridItem(
                //   title: 'donate_card_title',
                //   icon: Ionicons.heart_outline,
                //   url: Uri.parse('https://www.paypal.com/donate?hosted_button_id=EE3W7PS6AHEP8&source=url'),
                // ),
                // GridItem(
                //   title: 'website_card_title',
                //   icon: Ionicons.desktop_outline,
                //   url: Uri.parse('https://feichtinger.dev'),
                // ),
              ],
            ),
            const TextDivider(text: 'stats_divider_title'),
            // GridView.count(
            //   physics: const NeverScrollableScrollPhysics(),
            //   crossAxisCount: 2,
            //   childAspectRatio: 2 / 1.15,
            //   crossAxisSpacing: 8,
            //   mainAxisSpacing: 8,
            //   shrinkWrap: true,
            //   padding: EdgeInsets.zero,
            //   children: <GridItem>[

            //     // GridItem(
            //     //   title: 'flutter_bloc',
            //     //   icon: Ionicons.apps_outline,
            //     //   url: Uri.parse('https://pub.dev/packages/flutter_bloc/versions/8.0.1'),
            //     //   subtitle: '8.0.1',
            //     // ),
            //     // GridItem(
            //     //   title: 'bloc',
            //     //   icon: Ionicons.grid_outline,
            //     //   url: Uri.parse('https://pub.dev/packages/bloc/versions/8.1.0'),
            //     //   subtitle: '8.1.0',
            //     // ),
            //   ],
            // ),
            const SizedBox(height: 36),
          ]),
    );
  }
}
