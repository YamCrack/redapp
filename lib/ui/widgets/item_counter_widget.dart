import 'package:flutter/material.dart';

import '../../config/constants.dart';

class ItemCounterWidget extends StatefulWidget {
  ItemCounterWidget({super.key, this.onAmountChanged, this.amount = 1});

  final Function? onAmountChanged;
  int amount;
  @override
  ItemCounterWidgetState createState() => ItemCounterWidgetState();
}

class ItemCounterWidgetState extends State<ItemCounterWidget> {
  int get amount => widget.amount;
  set amount(int value) {
    widget.amount = value;
    if (widget.onAmountChanged != null) {
      widget.onAmountChanged!(value);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        iconWidget(Icons.remove, iconColor: Colors.grey, onPressed: decrementAmount), // AppColors.darkGrey
        const SizedBox(width: 18),
        Container(width: 30, child: Center(child: getText(text: amount.toString(), fontSize: 18, isBold: true))),
        const SizedBox(width: 18),
        iconWidget(Icons.add, iconColor: kPrimaryColor, onPressed: incrementAmount) //AppColors.primaryColor
      ],
    );
  }

  void incrementAmount() {
    setState(() {
      amount = amount + 1;
    });
  }

  void decrementAmount() {
    if (amount <= 0) return;
    setState(() {
      amount = amount - 1;
    });
  }

  Widget iconWidget(IconData iconData, {Color? iconColor, onPressed}) {
    return GestureDetector(
      onTap: () {
        if (onPressed != null) {
          onPressed();
        }
      },
      child: Container(
        height: 45,
        width: 45,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(17),
          border: Border.all(
            color: Color(0xffE2E2E2),
          ),
        ),
        child: Center(
          child: Icon(
            iconData,
            color: iconColor ?? Colors.black,
            size: 25,
          ),
        ),
      ),
    );
  }

  Widget getText({required String text, required double fontSize, bool isBold = false, Color color = Colors.black}) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
        color: color,
      ),
    );
  }
}
