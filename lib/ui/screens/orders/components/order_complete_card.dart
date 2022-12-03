import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../config/constants.dart';
import '../../../../config/size_config.dart';
import '../../../../cubit/order_cubit.dart';
import '../../../../data/models/order_item_model.dart';
import '../../../../data/models/order_model.dart';
import '../../../../data/models/product_model.dart';
import '../../../../shared/utils/format_utils.dart';
import '../../../widgets/default_button.dart';
import '../../products/select_product.dart';
// import '../../../constants.dart';
// import '../../../size_config.dart';

class OrderCompleteCard extends StatefulWidget {
  const OrderCompleteCard({super.key, required this.order});

  @override
  State<OrderCompleteCard> createState() => _OrderCompleteCardState();

  final OrderModel order;
}

class _OrderCompleteCardState extends State<OrderCompleteCard> {
  OrderModel get order => widget.order;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: getProportionateScreenWidth(15),
        horizontal: getProportionateScreenWidth(30),
      ),
      // height: 174,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, -15),
            blurRadius: 20,
            color: const Color(0xFFDADADA).withOpacity(0.15),
          )
        ],
      ),
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                    padding: const EdgeInsets.all(4),
                    height: getProportionateScreenWidth(30),
                    width: getProportionateScreenWidth(30),
                    decoration: BoxDecoration(
                      color: const Color(0xFFF5F6F9),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Icon(Ionicons.receipt) // SvgPicture.asset("assets/icons/receipt.svg"),
                    ),
                const Spacer(),
                GestureDetector(
                  onTap: _selectProduct,
                  child: Row(
                    children: const <Widget>[
                      Text(
                        'Agregar Articulo',
                      ),
                      SizedBox(width: 10),
                      Icon(Icons.add_box, //arrow_forward_ios,
                          size: 22,
                          color: kPrimaryColor
                          // color: kTextColor,
                          )
                    ],
                  ),
                )
              ],
            ),
            SizedBox(height: getProportionateScreenHeight(20)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text.rich(
                  TextSpan(
                    text: 'Total:\n',
                    children: [
                      TextSpan(
                        text: formatCurrency(order.total),
                        style: const TextStyle(fontSize: 16, color: Colors.black),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: getProportionateScreenWidth(190),
                  child: DefaultButton(
                    text: order.isNew() ? 'Generar Pedido' : 'Actualizar Pedido',
                    press: () {
                      context.read<OrderCubit>().createOrUpdateOrder(order);
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _selectProduct() async {
    final ProductModel? prod = await Navigator.of(context).push<ProductModel>(MaterialPageRoute(
      builder: (routeContext) => const SelectProductScreen(),
    ));

    if (prod != null) {
      _productSelected(prod);
    }
  }

  Future<void> _productSelected(ProductModel prod) async {
    context.read<OrderCubit>().addProduct(order, prod);
  }
}
