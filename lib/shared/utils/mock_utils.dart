import 'dart:convert';

import 'package:flutter/material.dart';

import '../../data/models/order_model.dart';

Future<OrderModel> getMockOrder(BuildContext context) async {
  final String data = await DefaultAssetBundle.of(context).loadString('assets/mock/order.json');
  final Map<String, dynamic> jsonResult = jsonDecode(data) as Map<String, dynamic>; //latest Dart
  return OrderModel.fromJson(jsonResult);
}
