import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
// import 'package:shop_app/components/default_button.dart';

import '../../../../config/size_config.dart';
import '../../../../data/models/order_model.dart';
import '../../../../shared/utils/format_utils.dart';
import '../../../widgets/default_button.dart';
// import '../../../constants.dart';
// import '../../../size_config.dart';

class CheckoutCard extends StatelessWidget {
  const CheckoutCard({super.key, required this.order});

  final OrderModel order;

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
            offset: Offset(0, -15),
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
                const Text('Agregar Articulo'),
                const SizedBox(width: 10),
                const Icon(
                  Icons.add_box, //arrow_forward_ios,
                  size: 22,
                  // color: kTextColor,
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
                    press: () {},
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
