import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

import '../../data/models/user_model.dart';

class UserListCard extends StatelessWidget {
  const UserListCard({super.key, required this.user, this.onTap});

  final UserModel user;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 2,
        shadowColor: Theme.of(context).colorScheme.shadow,
        color: Theme.of(context).colorScheme.surface,
        // shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(12))),
        child: ListTile(
          onTap: onTap,
          // shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(12))),
          title: Row(
            children: <Widget>[
              Icon(
                Ionicons.person,
                color: Theme.of(context).colorScheme.primary,
                size: 32,
              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    user.firstName!,
                    style: Theme.of(context).textTheme.titleMedium!.apply(fontWeightDelta: 2, fontSizeFactor: 0.9),
                  ),
                  Text(
                    user.taxId ?? '',
                    style: Theme.of(context).textTheme.titleMedium!.apply(fontWeightDelta: 1, fontSizeFactor: 0.8),
                  ),
                ],
              ),
            ],
          ),
          subtitle: Padding(
              padding: const EdgeInsets.only(left: 40),
              child: Text(
                ' ${user!.email!}',
                style: Theme.of(context).textTheme.bodyMedium!.apply(fontSizeFactor: 0.9),
              )),
        ));
  }
}
