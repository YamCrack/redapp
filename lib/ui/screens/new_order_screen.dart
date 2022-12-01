import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

import '../../data/models/user_model.dart';
import '../widgets/first_screen/info_card.dart';
import '../widgets/first_screen/theme_card.dart';
import '../widgets/grid_item.dart';
import '../widgets/header.dart';
import '../widgets/second_screen/link_card.dart';
import '../widgets/second_screen/text_divider.dart';
import '../widgets/user_card.dart';

class NewOrderScreen extends StatefulWidget {
  const NewOrderScreen({super.key});

  @override
  State<NewOrderScreen> createState() => _NewOrderScreenState();
}

class _NewOrderScreenState extends State<NewOrderScreen> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Theme.of(context).colorScheme.background,
      child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          physics: const BouncingScrollPhysics(),
          children: <Widget>[
            const SizedBox(height: 36),
            const UserCard(),
            const TextDivider(text: 'items_divider_title'),
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
                  title: 'instagram_card_title',
                  icon: Ionicons.logo_instagram,
                  url: Uri.parse('https://www.instagram.com/anfeichtinger'),
                ),
                GridItem(
                  title: 'twitter_card_title',
                  icon: Ionicons.logo_twitter,
                  url: Uri.parse('https://twitter.com/_pharrax'),
                ),
              ],
            ),
            const TextDivider(text: 'packages_divider_title'),
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
                  title: 'flutter_bloc',
                  icon: Ionicons.apps_outline,
                  url: Uri.parse('https://pub.dev/packages/flutter_bloc/versions/8.0.1'),
                  subtitle: '8.0.1',
                ),
                GridItem(
                  title: 'bloc',
                  icon: Ionicons.grid_outline,
                  url: Uri.parse('https://pub.dev/packages/bloc/versions/8.1.0'),
                  subtitle: '8.1.0',
                ),
              ],
            ),
            const SizedBox(height: 36),
          ]),
    );
  }
}
