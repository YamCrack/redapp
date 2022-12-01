import 'package:hydrated_bloc/hydrated_bloc.dart';

import '../data/di/service_locator.dart';
import '../data/models/user_model.dart';
import '../data/repository/auth_repository.dart';
import 'authentication_state.dart';

class AuthenticationCubit extends HydratedCubit<AuthenticationState> {
  AuthenticationCubit() : super(AuthenticationInitial());

  final AuthRepository _authRepo = getIt<AuthRepository>();

  Future<void> login(String username, String password) async {
    emit(AuthenticationLoading());
    try {
      final user = await _authRepo.login(username, password);
      emit(AuthenticationAuthenticated(user: user));
    } catch (e) {
      emit(AuthenticationFailure(message: e.toString()));
    }
  }

  @override
  AuthenticationState? fromJson(Map<String, dynamic> json) {
    if (json['user'] == null) {
      return AuthenticationNotAuthenticated();
    } else {
      final UserModel user = UserModel.fromJson(json['user'] as Map<String, dynamic>);
      return AuthenticationAuthenticated(user: user);
    }
  }

  @override
  Map<String, Map<String, dynamic>?> toJson(AuthenticationState state) {
    return <String, Map<String, dynamic>?>{'user': state is AuthenticationAuthenticated ? state.user.toJson() : null};
  }
}
