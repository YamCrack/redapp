import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../data/di/service_locator.dart';
import '../data/models/order_response_model.dart';
import '../data/repository/auth_repository.dart';
import '../data/repository/order_repository.dart';

part 'order_list_state.dart';

class OrderListCubit extends Cubit<OrderListState> {
  OrderListCubit() : super(OrderListInitial());

  final OrderRepository _orderRepository = getIt<OrderRepository>();
  final AuthRepository _authRepository = getIt<AuthRepository>();

  Future<void> getActiveOrders() async {
    emit(OrderListLoading());
    try {
      final String? userId = _authRepository.currentUser?.id;

      if (userId == null) {
        emit(OrderListFail('Usuario no autenticado'));
        return;
      }

      final OrderResponseModel result = await _orderRepository.activeOrders(userId);
      emit(OrderListFetched(result));
    } catch (e) {
      emit(OrderListFail(e.toString()));
    }
  }
}
