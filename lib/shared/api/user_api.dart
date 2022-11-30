import 'package:dio/dio.dart';
import 'api_utils.dart';
import 'constants/endpoints.dart';
import 'dio_client.dart';

class UserApi {
  UserApi({required this.dioClient});

  final DioClient dioClient;

  Future<Response> search(String query) async {
    try {
      final Map<String, dynamic> data = {
        'criteria': getLikeUserCriteria(query),
        'limit': 20,
        'offset': 0,
      };

      final Response response =
          await dioClient.post(Endpoints.usersList, data: data);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> info(String? id, String? code) async {
    try {
      Map<String, String> data = {};
      if (id != null) {
        data['id'] = id;
      }

      if (code != null) {
        data['code'] = code;
      }

      final Response response =
          await dioClient.post(Endpoints.usersInfo, data: data);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> login(String username, String password) async {
    try {
      final Response response = await dioClient.post(Endpoints.usersLogin,
          data: <String, String>{'username': username, 'password': password});
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<void> remove(String id) async {
    try {
      await dioClient
          .post(Endpoints.usersRemove, data: <String, String>{'id': id});
    } catch (e) {
      rethrow;
    }
  }
}
