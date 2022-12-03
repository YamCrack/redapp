import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../data/models/order_item_model.dart';

part 'order_item_edit_state.dart';

class OrderItemEditCubit extends Cubit<OrderItemEditState> {
  OrderItemEditCubit() : super(OrderItemEditInitial());

  void updateItem(OrderItemModel item) {
    emit(OrderItemEditUpdating());
    item.recalculateTotals();
    emit(OrderItemEditUpdated(item));
  }
}
