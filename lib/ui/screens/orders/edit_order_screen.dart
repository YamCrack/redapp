import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../cubit/order_cubit.dart';
import '../../../data/models/order_model.dart';
import 'components/order_body.dart';
import 'components/order_complete_card.dart';

class EditOrderScreen extends StatelessWidget {
  const EditOrderScreen({super.key, this.orderId});

  final String? orderId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OrderCubit()..getOrder(orderId, context),
      child: BlocBuilder<OrderCubit, OrderState>(
        builder: (context, state) {
          if (state is OrderStateLoading || state is OrderStateInitial) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is OrderStateFail) {
            return Center(child: Text('Error: ${state.message}', style: Theme.of(context).textTheme.bodyMedium));
          }

          final OrderModel order = (state as OrderStateFetched).order;

          return Scaffold(
            appBar: buildAppBar(context, order),
            body: Body(order: order),
            bottomNavigationBar: OrderCompleteCard(
              order: order,
            ),
          );
        },
      ),
    );
  }

  AppBar buildAppBar(BuildContext context, OrderModel order) {
    final Brightness brightness = Theme.of(context).colorScheme.brightness;
    return AppBar(
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarBrightness: brightness,
        systemStatusBarContrastEnforced: false,
        statusBarColor: Theme.of(context).colorScheme.background,
        statusBarIconBrightness: brightness == Brightness.dark ? Brightness.light : Brightness.dark,
      ),
      title: Column(
        children: [
          Text(
            order.isNew() ? 'Nuevo Pedido' : 'Editar Pedido',
          ),
          Text(
            order.itemsCount() == 0 ? 'Sin Artículos' : '${order.itemsCount().toInt()} Artículos',
            style: Theme.of(context).textTheme.labelSmall?.copyWith(color: Colors.white),
          ),
        ],
      ),
    );
  }
}
