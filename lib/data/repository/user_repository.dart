import 'package:dio/dio.dart';
import '../../shared/api/dio_exception.dart';
import '../../shared/api/user_api.dart';
import '../models/user_model.dart';
import '../models/user_response_model.dart';

class UserRepository {
  UserRepository(this.userApi);

  final UserApi userApi;

  Future<UserResponse> searchUsers(String query) async {
    try {
      final Response<dynamic> response = await userApi.search(query);
      final UserResponse res = UserResponse.fromJson(response.data as Map<String, dynamic>);
      return res;
    } on DioError catch (e) {
      final String errorMessage = DioExceptions.fromDioError(e).toString();
      throw Exception(errorMessage);
    }
  }

  Future<UserModel> getUserInfo(String? id, String? code) async {
    try {
      final Response<dynamic> response = await userApi.info(id, code);
      final UserResponse res = UserResponse.fromJson(response.data as Map<String, dynamic>);
      return res.user!;
    } on DioError catch (e) {
      final String errorMessage = DioExceptions.fromDioError(e).toString();
      throw Exception(errorMessage);
    }
  }
}
