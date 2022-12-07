import 'package:awesome_dialog/awesome_dialog.dart';
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
      create: (context) => OrderCubit()..getOrder(orderId),
      child: BlocConsumer<OrderCubit, OrderState>(
        listenWhen: (previous, current) => current is OrderStateFail || current is OrderStateSaved,
        listener: (context, state) {
          if (state is OrderStateFail) {
            errorDialog(context, state.message);
          } else if (state is OrderStateSaved) {
            savedDialog(context);
          }
        },
        buildWhen: (previous, current) => current is OrderStateFetched,
        builder: (context, state) {
          if (state is OrderStateLoading) {
            return const Scaffold(
              body: Center(child: CircularProgressIndicator()),
            );
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

  void errorDialog(BuildContext context, String message) {
    final dialog = AwesomeDialog(
      context: context,
      dialogType: DialogType.error,
      animType: AnimType.rightSlide,
      title: 'Error',
      desc: message,
      // btnCancelOnPress: () {},
      // btnOkOnPress: () {},
    ); // ..show();
    dialog.show();
  }

  void savedDialog(BuildContext context) {
    final dialog = AwesomeDialog(
      context: context,
      dialogType: DialogType.success,
      animType: AnimType.rightSlide,
      title: 'Orden guardada',
      desc: 'La orden se ha guardado correctamente',
      btnOkOnPress: () {},
    ); // ..show();
    dialog.show();
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
