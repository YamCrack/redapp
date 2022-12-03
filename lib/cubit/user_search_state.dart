part of 'user_search_cubit.dart';

abstract class UserSearchState extends Equatable {
  const UserSearchState();

  @override
  List<Object> get props => [];
}

class UserSearchInitial extends UserSearchState {}

class UserSearchLoading extends UserSearchState {}

class UserSearchFetched extends UserSearchState {
  const UserSearchFetched(this.response);

  final UserResponse response;

  @override
  List<Object> get props => [response];
}

class UserSearchError extends UserSearchState {
  const UserSearchError(this.message);

  final String message;

  @override
  List<Object> get props => [message];
}
