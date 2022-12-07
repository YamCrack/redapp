import 'package:hydrated_bloc/hydrated_bloc.dart';

import '../data/di/service_locator.dart';
import '../data/models/user_model.dart';
import '../data/repository/auth_repository.dart';
import '../data/repository/user_repository.dart';
import 'authentication_state.dart';

class AuthenticationCubit extends Cubit<AuthenticationState> {
  AuthenticationCubit() : super(AuthenticationInitial());

  final AuthRepository _authRepo = getIt<AuthRepository>();
  final UserRepository _userRepository = getIt<UserRepository>();

  Future<void> login(String username, String password) async {
    emit(AuthenticationLoading());
    try {
      final user = await _authRepo.login(username, password);
      emit(AuthenticationAuthenticated(user: user));
    } catch (e) {
      emit(AuthenticationFailure(message: e.toString()));
    }
  }

  Future<void> checkSession() async {
    emit(AuthenticationLoading());
    try {
      if (_authRepo.getSessionId() == null) {
        emit(AuthenticationNotAuthenticated());
        return;
      }

      print('revisando session');
      final user = await _userRepository.info();
      _authRepo.onAuthChange.add(user);
      emit(AuthenticationAuthenticated(user: user));
    } catch (e) {
      print('revisando session error: $e');
      emit(AuthenticationNotAuthenticated());
      // emit(AuthenticationFailure(message: e.toString()));
    }
  }

  // @override
  // AuthenticationState? fromJson(Map<String, dynamic> json) {
  //   if (json['user'] == null) {
  //     return AuthenticationNotAuthenticated();
  //   } else {
  //     final UserModel user = UserModel.fromJson(json['user'] as Map<String, dynamic>);
  //     return AuthenticationAuthenticated(user: user);
  //   }
  // }

  // @override
  // Map<String, Map<String, dynamic>?> toJson(AuthenticationState state) {
  //   return <String, Map<String, dynamic>?>{'user': state is AuthenticationAuthenticated ? state.user.toJson() : null};
  // }
}
