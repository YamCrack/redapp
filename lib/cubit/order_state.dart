part of 'order_cubit.dart';

abstract class OrderState extends Equatable {
  const OrderState();

  @override
  List<Object> get props => [];
}

class OrderStateInitial extends OrderState {}

class OrderStateLoading extends OrderState {}

class OrderStateUpdating extends OrderState {}

class OrderStateSaved extends OrderState {}

class OrderStateFetched extends OrderState {
  const OrderStateFetched(this.order);

  final OrderModel order;

  @override
  List<Object> get props => [order.id ?? '', order.itemsCount(), order.total ?? 0];
}

class OrderStateFail extends OrderState {
  const OrderStateFail(this.message);

  final String message;

  @override
  List<Object> get props => [message];
}
