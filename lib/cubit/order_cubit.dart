import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

import '../data/di/service_locator.dart';
import '../data/models/order_item_model.dart';
import '../data/models/order_model.dart';
import '../data/models/product_model.dart';
import '../data/models/user_model.dart';
import '../data/repository/order_repository.dart';
import '../shared/utils/mock_utils.dart';

part 'order_state.dart';

class OrderCubit extends Cubit<OrderState> {
  OrderCubit() : super(OrderStateInitial());

  final OrderRepository _orderRepository = getIt<OrderRepository>();

  Future<void> getOrder(String? orderId, BuildContext context) async {
    emit(OrderStateLoading());
    try {
      final OrderModel order = orderId != null ? await _orderRepository.info(orderId) : OrderModel();
      // final OrderModel order = await getMockOrder(context);
      emit(OrderStateFetched(order));
    } catch (e) {
      emit(OrderStateFail(e.toString()));
    }
  }

  Future<void> removeItem(OrderModel order, OrderItemModel item) async {
    // emit(OrderStateLoading());
    try {
      // final OrderModel order = orderId != null ? OrderModel() : OrderModel();
      order.items.remove(item);
      order.recalculateTotals();
      // final OrderModel order = await getMockOrder(context);
      updateOrder(order);
    } catch (e) {
      emit(OrderStateFail(e.toString()));
    }
  }

  Future<void> updateUser(OrderModel order, UserModel user) async {
    try {
      // final OrderModel order = orderId != null ? OrderModel() : OrderModel();
      order.user = user;
      order.idUser = user.id;
      order.recalculateTotals();
      // final OrderModel order = await getMockOrder(context);
      updateOrder(order);
    } catch (e) {
      emit(OrderStateFail(e.toString()));
    }
  }

  Future<void> addProduct(OrderModel order, ProductModel product) async {
    try {
      // final OrderModel order = orderId != null ? OrderModel() : OrderModel();
      if (order.items.isEmpty) {
        order.items = [];
      }
      order.items.add(OrderItemModel.fromProduct(product));
      order.recalculateTotals();
      // final OrderModel order = await getMockOrder(context);
      updateOrder(order);
    } catch (e) {
      emit(OrderStateFail(e.toString()));
    }
  }

  void updateOrder(OrderModel order) {
    emit(OrderStateUpdating());
    order.recalculateTotals();
    emit(OrderStateFetched(order));
  }

  Future<void> createOrUpdateOrder(OrderModel order) async {
    emit(OrderStateLoading());
    try {
      final OrderModel updatedOrder =
          order.isNew() ? await _orderRepository.createOrder(order) : await _orderRepository.updateOrder(order);
      emit(OrderStateFetched(updatedOrder));
    } catch (e) {
      emit(OrderStateFail(e.toString()));
    }
  }
}
