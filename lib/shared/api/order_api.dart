import 'package:dio/dio.dart';
import '../../data/models/order_model.dart';
import 'constants/endpoints.dart';
import 'dio_client.dart';

class OrderApi {
  OrderApi({required this.dioClient});

  final DioClient dioClient;

  Future<Response<dynamic>> add(OrderModel order) async {
    try {
      final Map<String, dynamic> data = {
        'userId': order.idUser,
        // 'addressId':
        'notes': order.notes,
        'items': order.getItemsApi(),
      };

      final Response<dynamic> response = await dioClient.post(Endpoints.orderAdd, data: data);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response<dynamic>> update(OrderModel order) async {
    try {
      final Map<String, dynamic> data = {
        'id': order.id,
        // 'userId': order.idUser,
        // 'addressId':
        'notes': order.notes,
        'items': order.getItemsApi(),
        'salesmanId': order.idSalesman,
        'status': order.status,
        'courierId': order.idCourier,
        'fulfillerId': order.idFulfiller,
      };

      final Response<dynamic> response = await dioClient.post(Endpoints.orderUpdate, data: data);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response<dynamic>> info(String id) async {
    try {
      final Map<String, dynamic> data = {
        'id': id,
      };

      final Response<dynamic> response = await dioClient.post(Endpoints.orderInfo, data: data);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  // Future<Response> info(String? id, String? code) async {
  //   try {
  //     Map<String, String> data = {};
  //     if (id != null) {
  //       data['id'] = id;
  //     }

  //     if (code != null) {
  //       data['code'] = code;
  //     }

  //     final Response response = await dioClient.post(Endpoints.usersInfo, data: data);
  //     return response;
  //   } catch (e) {
  //     rethrow;
  //   }
  // }
}
