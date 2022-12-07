import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

import '../widgets/first_screen/info_card.dart';
import '../widgets/first_screen/theme_card.dart';
import '../widgets/header.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Theme.of(context).colorScheme.background,
      child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          physics: const BouncingScrollPhysics(),
          children: <Widget>[
            const Header(text: 'Red Pedidos'),

            const SizedBox(height: 8),

            GridView.count(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                crossAxisCount: 3,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
                childAspectRatio: 1.75 / 1,
                padding: EdgeInsets.zero,
                children: const <ThemeCard>[
                  ThemeCard(
                    mode: ThemeMode.system,
                    icon: Ionicons.contrast_outline,
                  ),
                  ThemeCard(
                    mode: ThemeMode.light,
                    icon: Ionicons.sunny_outline,
                  ),
                  ThemeCard(
                    mode: ThemeMode.dark,
                    icon: Ionicons.moon_outline,
                  ),
                ]),

            /// Example: Good way to add space between items without using Paddings
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Divider(
                color: Theme.of(context).colorScheme.onBackground.withOpacity(.4),
              ),
            ),
            const SizedBox(height: 8),

            // GridView.count(
            //   physics: const NeverScrollableScrollPhysics(),
            //   shrinkWrap: true,
            //   crossAxisCount: 2,
            //   crossAxisSpacing: 8,
            //   mainAxisSpacing: 8,
            //   childAspectRatio: 4 / 5.5,
            //   padding: EdgeInsets.zero,
            //   children: const <InfoCard>[
            //     /// Example: it is good practice to put widgets in separate files.
            //     /// This way the screen files won't become too large and
            //     /// the code becomes more clear.
            //     InfoCard(
            //         title: '',
            //         content: 'localization_content',
            //         icon: Ionicons.language_outline,
            //         isPrimaryColor: true),
            //     InfoCard(
            //         title: 'linting_title',
            //         content: 'linting_content',
            //         icon: Ionicons.code_slash_outline,
            //         isPrimaryColor: false),

            //   ],
            // ),
            const SizedBox(height: 36),
          ]),
    );
  }
}
