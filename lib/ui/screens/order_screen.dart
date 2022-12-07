import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionicons/ionicons.dart';

import '../../cubit/order_cubit.dart';
import '../../data/models/order_model.dart';
import '../../data/models/user_model.dart';
import '../widgets/first_screen/info_card.dart';
import '../widgets/first_screen/theme_card.dart';
import '../widgets/grid_item.dart';
import '../widgets/header.dart';
import '../widgets/order_item_card.dart';
import '../widgets/second_screen/link_card.dart';
import '../widgets/second_screen/text_divider.dart';
import '../widgets/user_card.dart';

class NewOrderScreen extends StatefulWidget {
  const NewOrderScreen({super.key, this.orderId});

  final String? orderId;
  @override
  State<NewOrderScreen> createState() => _NewOrderScreenState();
}

class _NewOrderScreenState extends State<NewOrderScreen> {
  String? get orderId => widget.orderId;

  // final String? orderId;

  @override
  Widget build(BuildContext context) {
    return Material(
        color: Theme.of(context).colorScheme.background,
        child: BlocProvider(
            create: (context) => OrderCubit()..getOrder(orderId),
            child: BlocBuilder<OrderCubit, OrderState>(
              builder: (context, state) {
                if (state is OrderStateLoading || state is OrderStateInitial) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is OrderStateFail) {
                  return const Center(child: Text('Error'));
                }

                final OrderModel order = (state as OrderStateFetched).order;

                return LayoutBuilder(builder: (BuildContext context, BoxConstraints constraints) {
                  return SingleChildScrollView(
                    child: ConstrainedBox(
                      constraints: constraints.copyWith(
                        minHeight: constraints.maxHeight,
                        maxHeight: double.infinity,
                      ),
                      child: IntrinsicHeight(
                        child: Column(
                          children: <Widget>[
                            const SizedBox(height: 36),
                            UserCard(
                              user: order.user,
                            ),
                            const TextDivider(text: 'items_divider_title'),
                            ...order.items.map((item) => OrderItemCard(orderItem: item)).toList(),
                            if (order.items.isEmpty)
                              const Center(child: Text('La orden no tiene artiulos'))
                            else
                              Container(),
                            Expanded(
                              child: Align(
                                alignment: Alignment.bottomCenter,
                                child: Container(
                                  width: double.infinity,
                                  color: Colors.red,
                                  padding: EdgeInsets.all(12.0),
                                  child: Text(
                                    'FOOTER',
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                });

                // return ListView(
                //   padding: const EdgeInsets.symmetric(horizontal: 16),
                //   physics: const BouncingScrollPhysics(),
                //   children: <Widget>[
                //     const SizedBox(height: 36),
                //     UserCard(
                //       user: order.user,
                //     ),
                //     const TextDivider(text: 'items_divider_title'),
                //     ...order.items.map((item) => OrderItemCard(orderItem: item)).toList(),
                //     // const SizedBox(height: 36),
                //   ],
                // );
              },
            )));
  }
}
