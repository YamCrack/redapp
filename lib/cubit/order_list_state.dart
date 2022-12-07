part of 'order_list_cubit.dart';

abstract class OrderListState extends Equatable {
  const OrderListState();

  @override
  List<Object> get props => [];
}

class OrderListInitial extends OrderListState {}

class OrderListLoading extends OrderListState {}

class OrderListFetched extends OrderListState {
  const OrderListFetched(this.result);

  final OrderResponseModel result;

  @override
  List<Object> get props => [result];
}

class OrderListFail extends OrderListState {
  const OrderListFail(this.message);

  final String message;

  @override
  List<Object> get props => [message];
}
