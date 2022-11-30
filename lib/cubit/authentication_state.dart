import 'package:equatable/equatable.dart';
import '../data/models/user_model.dart';

abstract class AuthenticationState extends Equatable {
  const AuthenticationState();

  @override
  List<Object> get props => [];
}

class AuthenticationInitial extends AuthenticationState {}

class AuthenticationLoading extends AuthenticationState {}

class AuthenticationNotAuthenticated extends AuthenticationState {
  @override
  String toString() => 'NotAuthenticated';
}

class AuthenticationAuthenticated extends AuthenticationState {
  const AuthenticationAuthenticated({required this.user});

  final UserModel user;

  @override
  List<Object> get props => [user];

  @override
  String toString() => 'Authenticated';
}

class AuthenticationFailure extends AuthenticationState {
  const AuthenticationFailure({required this.message});

  final String message;

  @override
  List<Object> get props => [message];
}
