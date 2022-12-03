import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../config/constants.dart';
import '../../../cubit/order_item_edit_cubit.dart';
import '../../../cubit/product_info_cubit.dart';
import '../../../data/models/order_item_model.dart';
import '../../../data/models/price_model.dart';
import '../../../data/models/product_model.dart';
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
    return BlocProvider(
      create: (context) => ProductInfoCubit()..fetchProduct(item.idProduct!),
      child: BlocBuilder<ProductInfoCubit, ProductInfoState>(
        builder: (context, state) {
          if (state is ProductInfoLoading || state is ProductInfoInitial) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is ProductInfoError) {
            return Center(
                child: Text(
              state.message,
              style: const TextStyle(backgroundColor: Colors.white),
            ));
          }

          if (state is ProductInfoFetched) {
            final ProductModel product = state.product;

            return BlocProvider(
              create: (context) => OrderItemEditCubit()..updateItem(item),
              child: BlocBuilder<OrderItemEditCubit, OrderItemEditState>(
                builder: (context, state) {
                  return sheetContent(product, item, context);
                },
              ),
            );
          }

          return Container();
        },
      ),
    );

    // sheetContent();
  }

  Widget sheetContent(ProductModel product, OrderItemModel item, BuildContext context) {
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
          if (product.prices!.length > 1) getDivider() else Container(),
          if (product.prices!.length > 1)
            // checkoutRow('Precio (Precio de Lista)', trailingText: 'Cambiar')
            ...product.prices!.map((price) {
              return getPriceWidget(
                price,
                item,
                onTap: () {
                  item.price = price.price;
                  item.priceId = price.id;
                  context.read<OrderItemEditCubit>().updateItem(item);
                },
              );
            }).toList()
          else
            Container(),

          getDivider(),
          sheetRow('Cantidad',
              trailingWidget: ItemCounterWidget(
                amount: item.quantity!.toInt(),
                onAmountChanged: (int value) {
                  item.quantity = value.toDouble();
                  context.read<OrderItemEditCubit>().updateItem(item);
                },
              )),
          getDivider(),
          sheetRow('Importe total', trailingText: formatCurrency(item.amount)),
          getDivider(),
          const SizedBox(
            height: 30,
          ),
          // termsAndConditionsAgreement(context),
          Container(
            margin: const EdgeInsets.only(
              top: 25,
            ),
            child: DefaultButton(
                text: 'Guardar',
                press: () {
                  Navigator.pop(context, item);
                }),
          ),
        ],
      ),
    );
  }

  Widget getPriceWidget(PriceModel price, OrderItemModel item, {VoidCallback? onTap}) {
    return Container(
        color: item.price == price.price ? kPrimaryLightColor : Colors.white,
        child: sheetRow(price.name!, trailingText: formatCurrency(price.price), onTap: onTap));
  }

  Widget getDivider() {
    return const Divider(
      thickness: 1,
      color: Color(0xFFE2E2E2),
    );
  }

  Widget sheetRow(String label, {String? trailingText, Widget? trailingWidget, VoidCallback? onTap}) {
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: 15,
      ),
      child: GestureDetector(
          onTap: onTap,
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
          )),
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
