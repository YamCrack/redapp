import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:rxdart/rxdart.dart';

import '../data/di/service_locator.dart';
import '../data/models/user_response_model.dart';
import '../data/repository/user_repository.dart';

part 'user_search_state.dart';

class UserSearchCubit extends Cubit<UserSearchState> {
  UserSearchCubit() : super(UserSearchInitial()) {
    _searchSubject.debounce((_) => TimerStream(true, const Duration(milliseconds: 500))).asyncMap((query) {
      _searchUsers(query);
    }).listen((_) {});
  }

  final BehaviorSubject<String> _searchSubject = BehaviorSubject<String>();
  final BehaviorSubject<UserResponse> _userResponseSubject = BehaviorSubject<UserResponse>();
  final UserRepository _userRepository = getIt<UserRepository>();

  void search(String query) {
    print('==========> mandando quer para procesar: $query');
    _searchSubject.add(query);
  }

  Future<void> _searchUsers(String query) async {
    print('==============> buscando saurios con: $query');
    emit(UserSearchLoading());
    try {
      final UserResponse response = await _userRepository.searchUsers(query);
      _userResponseSubject.add(response);
      // final UserResponse response = _userResponseSubject.value;
      emit(UserSearchFetched(response));
    } catch (e) {
      emit(UserSearchError(e.toString()));
    }
  }
}
