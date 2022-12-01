import 'package:dio/dio.dart';
import 'package:hive/hive.dart';
import 'package:rxdart/rxdart.dart';

import '../../shared/api/dio_exception.dart';
import '../../shared/api/user_api.dart';
import '../models/user_model.dart';
import '../models/user_response_model.dart';

class AuthRepository {
  AuthRepository(this.userApi);
  final UserApi userApi;
  final BehaviorSubject<UserModel?> onAuthChange = BehaviorSubject<UserModel?>();

  Stream<UserModel?> get onAuthStateChanged {
    return onAuthChange.stream;
  }

  Future<UserModel> login(String username, String password) async {
    try {
      final Response<dynamic> response = await userApi.login(username, password);
      final UserResponse res = UserResponse.fromJson(response.data as Map<String, dynamic>);
      final UserModel user = res.user!;
      onAuthChange.add(user);
      _saveSessionId(res.sessionID);
      return user;
    } on DioError catch (e) {
      final String errorMessage = DioExceptions.fromDioError(e).toString();
      throw Exception(errorMessage);
    }
  }

  Future<void> signOut() {
    onAuthChange.add(null);
    _saveSessionId(null);
    return Future<void>.value();
  }

  Future<void> _saveSessionId(String? sessionId) async {
    final box = await Hive.openBox('auth');
    box.put('sessionId', sessionId);
  }

  Future<String> _getSessionId() async {
    final box = await Hive.openBox('auth');
    return box.get('sessionId') as String;
  }
}
