import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../cubit/order_list_cubit.dart';
import '../../../data/models/order_model.dart';
import '../../../data/models/order_response_model.dart';
import '../../widgets/header.dart';
import '../orders/edit_order_screen.dart';
import 'components/order_list_card.dart';

class OverviewOrderScreen extends StatelessWidget {
  const OverviewOrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OrderListCubit()..getActiveOrders(),
      child: BlocConsumer<OrderListCubit, OrderListState>(
        listener: (context, state) {
          if (state is OrderListFail) {
            errorDialog(context, state.message);
          }
        },
        builder: (context, state) {
          return buildScreen(context, state);
        },
      ),
    );
  }

  Material buildScreen(BuildContext context, OrderListState state) {
    OrderResponseModel result = OrderResponseModel(orders: []);

    if (state is OrderListFetched) {
      result = state.result;
    }

    final List<Widget> ordersCards = result.orders!.isNotEmpty ? getOrdersCards(context, result.orders!) : [];

    return Material(
      color: Theme.of(context).colorScheme.background,
      child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          physics: const BouncingScrollPhysics(),
          children: <Widget>[
            const Header(text: 'Ordenes Activas'),
            ...ordersCards,
            if (state is OrderListLoading)
              const Center(child: CircularProgressIndicator())
            else
              const SizedBox(height: 36),
          ]),
    );
  }

  List<Widget> getOrdersCards(BuildContext context, List<OrderModel> orders, {VoidCallback? onClosed}) {
    return orders.map((order) {
      return OrderListCard(
          order: order,
          onTap: () {
            Navigator.of(context)
                .push(MaterialPageRoute(
              builder: (routeContext) => EditOrderScreen(
                orderId: order.id,
              ),
            ))
                .then((value) {
              BlocProvider.of<OrderListCubit>(context).getActiveOrders();
            });
          });
    }).toList();
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
}
