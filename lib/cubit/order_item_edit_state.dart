part of 'order_item_edit_cubit.dart';

abstract class OrderItemEditState extends Equatable {
  const OrderItemEditState();

  @override
  List<Object> get props => [];
}

class OrderItemEditInitial extends OrderItemEditState {}

class OrderItemEditUpdating extends OrderItemEditState {}

class OrderItemEditUpdated extends OrderItemEditState {
  const OrderItemEditUpdated(this.item);
  final OrderItemModel item;
  @override
  List<Object> get props => [item.id!];
}

class OrderItemEditError extends OrderItemEditState {
  const OrderItemEditError(this.message);
  final String message;
  @override
  List<Object> get props => [message];
}
