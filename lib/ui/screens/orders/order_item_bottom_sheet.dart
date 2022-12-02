import 'package:flutter/material.dart';
import '../../../data/models/order_item_model.dart';
import '../../../shared/utils/format_utils.dart';
import '../../widgets/app_text.dart';
import '../../widgets/default_button.dart';
import '../../widgets/item_counter_widget.dart';

class OrderItemBottomSheet extends StatefulWidget {
  const OrderItemBottomSheet({super.key, required this.item});

  final OrderItemModel item;

  @override
  OrderItemBottomSheetState createState() => OrderItemBottomSheetState();
}

class OrderItemBottomSheetState extends State<OrderItemBottomSheet> {
  OrderItemModel get item => widget.item;

  @override
  Widget build(BuildContext context) {
    return sheetContent();
  }

  Widget sheetContent() {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 25,
        vertical: 30,
      ),
      decoration:
          const BoxDecoration(color: Colors.white, borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
      child: Wrap(
        children: <Widget>[
          Row(
            children: [
              const AppText(
                text: 'Editar artículo',
                fontSize: 24,
                fontWeight: FontWeight.w600,
              ),
              const Spacer(),
              GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(
                    Icons.close,
                    size: 25,
                  ))
            ],
          ),
          Text(
            item.name!,
            style: const TextStyle(fontSize: 16),
          ),
          const SizedBox(
            height: 45,
          ),
          getDivider(),
          checkoutRow('Precio (Precio de Lista)', trailingText: 'Cambiar'),
          getDivider(),
          checkoutRow('Cantidad',
              trailingWidget: ItemCounterWidget(
                amount: item.quantity!.toInt(),
                onAmountChanged: (int value) {},
              )),
          getDivider(),
          checkoutRow('Importe total', trailingText: formatCurrency(item.amount)),
          getDivider(),
          const SizedBox(
            height: 30,
          ),
          // termsAndConditionsAgreement(context),
          Container(
            margin: const EdgeInsets.only(
              top: 25,
            ),
            child: DefaultButton(text: 'Guardar', press: () {}),
          ),
        ],
      ),
    );
  }

  Widget getDivider() {
    return const Divider(
      thickness: 1,
      color: Color(0xFFE2E2E2),
    );
  }

  // Widget termsAndConditionsAgreement(BuildContext context) {
  //   return RichText(
  //     text: TextSpan(
  //         text: 'By placing an order you agree to our',
  //         style: TextStyle(
  //           color: Color(0xFF7C7C7C),
  //           fontSize: 14,
  //           // fontFamily: Theme.of(context).textTheme.bodyText1.fontFamily,
  //           fontWeight: FontWeight.w600,
  //         ),
  //         children: [
  //           TextSpan(text: ' Terms', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
  //           TextSpan(text: ' And'),
  //           TextSpan(text: ' Conditions', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
  //         ]),
  //   );
  // }

  Widget checkoutRow(String label, {String? trailingText, Widget? trailingWidget, VoidCallback? onTap}) {
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: 15,
      ),
      child: Row(
        children: [
          AppText(
            text: label,
            fontSize: 18,
            color: const Color(0xFF7C7C7C),
            fontWeight: FontWeight.w600,
          ),
          const Spacer(),
          if (trailingText == null)
            trailingWidget!
          else
            AppText(
              text: trailingText,
              fontSize: 16,
              // color: Colors.black,
              fontWeight: FontWeight.w600,
            ),
          const SizedBox(
            width: 20,
          ),
          if (onTap == null)
            Container()
          else
            const Icon(
              Icons.arrow_forward_ios,
              size: 20,
            )
        ],
      ),
    );
  }

  void onPlaceOrderClicked() {
    Navigator.pop(context);
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Container();
          //return OrderFailedDialogue();
        });
  }
}
