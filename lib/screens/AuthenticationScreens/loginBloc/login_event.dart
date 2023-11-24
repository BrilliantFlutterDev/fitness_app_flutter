part of 'login_bloc.dart';

abstract class LoginEvent {}

class RefreshEvent extends LoginEvent {
  RefreshEvent();
}

class LoginUser extends LoginEvent {
  final String username;
  final String password;
  String? rememberMe = 'n';
  LoginUser({required this.username, required this.password, this.rememberMe});
}

class SignUpUser extends LoginEvent {
  final String username;
  final String email;
  final String password;
  SignUpUser(
      {required this.username, required this.email, required this.password});
}
