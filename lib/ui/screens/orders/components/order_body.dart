import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

// import '../../../size_config.dart';
import '../../../../cubit/order_cubit.dart';
import '../../../../data/models/order_item_model.dart';
import '../../../../data/models/order_model.dart';
import '../../../../data/models/product_model.dart';
import '../../../../data/models/user_model.dart';
import '../../../widgets/default_button.dart';
import '../../../widgets/user_card.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../products/select_product.dart';
import '../../select_user.dart';
import '../order_item_bottom_sheet.dart';
import 'order_item_card.dart';

class Body extends StatefulWidget {
  const Body({super.key, required this.order});

  final OrderModel order;

  @override
  BodyState createState() => BodyState();
}

class BodyState extends State<Body> {
  OrderModel get order => widget.order;
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20), //getProportionateScreenWidth(20)
        child: ListView(
          children: [
            UserCard(
              user: order.user,
              onTap: _selectUser,
            ),
            ...order.items.map((e) => getItemList(e, context)).toList(),
            if (order.items.isEmpty) const Center(child: Text('La orden no tiene artículos')) else Container(),
          ],
        )

        // ListView.builder(
        //   itemCount: order.items.length,
        //   itemBuilder: (context, index) => getItemList(index),
        // ),
        );
  }

  Padding getItemList(OrderItemModel item, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Dismissible(
        key: Key(item.idProduct!),
        direction: DismissDirection.endToStart,
        onDismissed: (direction) {
          // context.r
          // context.read<OrderCubit>()
          // context.read<AuthenticationCubit>().login(_emailController.text, _passwordController.text);
          context.read<OrderCubit>().removeItem(order, item);

          // setState(() {
          //   order.items.remove(item);
          // });
        },
        background: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
            color: const Color(0xFFFFE6E6),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Row(
            children: const [
              Spacer(),
              Icon(Ionicons.trash_bin),
            ],
          ),
        ),
        child: OrderItemCard(orderItem: item, onTap: () => showBottomSheet(context, item)),
      ),
    );
  }

  void _onItemEdited() {
    context.read<OrderCubit>().updateOrder(order);
  }

  Future<void> showBottomSheet(BuildContext context, OrderItemModel item) async {
    final orderItem = await showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        isDismissible: true,
        builder: (BuildContext bc) {
          return OrderItemBottomSheet(item: item);
        });

    if (orderItem != null) {
      _onItemEdited();
    }
  }

  Future<void> _selectUser() async {
    final UserModel? user = await Navigator.of(context).push<UserModel>(MaterialPageRoute(
      builder: (routeContext) => const SelectUserScreen(),
    ));

    if (user != null) {
      _userSelected(user);
    }
  }

  void _userSelected(UserModel user) {
    context.read<OrderCubit>().updateUser(order, user);
  }
}
