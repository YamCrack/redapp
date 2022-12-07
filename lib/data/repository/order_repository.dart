import 'package:dio/dio.dart';
import '../../shared/api/dio_exception.dart';
import '../../shared/api/order_api.dart';
import '../models/order_model.dart';
import '../models/order_response_model.dart';
import '../models/user_model.dart';
import '../models/user_response_model.dart';

class OrderRepository {
  OrderRepository(this.orderApi);

  final OrderApi orderApi;

  Future<OrderModel> createOrder(OrderModel order) async {
    try {
      final Response<dynamic> response = await orderApi.add(order);
      final OrderResponseModel res = OrderResponseModel.fromJson(response.data as Map<String, dynamic>);
      return res.order!;
    } on DioError catch (e) {
      final String errorMessage = DioExceptions.fromDioError(e).toString();
      throw Exception(errorMessage);
    }
  }

  Future<OrderModel> updateOrder(OrderModel order) async {
    try {
      final Response<dynamic> response = await orderApi.update(order);
      final OrderResponseModel res = OrderResponseModel.fromJson(response.data as Map<String, dynamic>);
      return res.order!;
    } on DioError catch (e) {
      final String errorMessage = DioExceptions.fromDioError(e).toString();
      throw Exception(errorMessage);
    }
  }

  Future<OrderModel> info(String id) async {
    try {
      final Response<dynamic> response = await orderApi.info(id);
      final OrderResponseModel res = OrderResponseModel.fromJson(response.data as Map<String, dynamic>);
      return res.order!;
    } on DioError catch (e) {
      final String errorMessage = DioExceptions.fromDioError(e).toString();
      throw Exception(errorMessage);
    }
  }

  Future<OrderResponseModel> activeOrders(String userId) async {
    try {
      final Response<dynamic> response = await orderApi.listActiveOrders(userId);
      final OrderResponseModel res = OrderResponseModel.fromJson(response.data as Map<String, dynamic>);
      return res;
    } on DioError catch (e) {
      final String errorMessage = DioExceptions.fromDioError(e).toString();
      throw Exception(errorMessage);
    }
  }
}
