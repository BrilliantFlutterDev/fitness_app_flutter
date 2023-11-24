part of 'login_bloc.dart';

@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {}

class RefreshState extends LoginState {}

class LoginSuccess extends LoginState {}

class SignUpSuccess extends LoginState {}

class SignUpVerifyOTP extends LoginState {}

class ChangeEmailVerified extends LoginState {}

class ForgetPasswordOTPSendSuccess extends LoginState {}

class RegisterBusinessStep1Submitted extends LoginState {}

class RegisterBusinessStep2Submitted extends LoginState {}

class EmailCheckedSuccess extends LoginState {}

class LoadingState extends LoginState {}

class ErrorState extends LoginState {
  final String error;
  ErrorState({required this.error});
}

class InternetErrorState extends LoginState {
  final String error;
  InternetErrorState({required this.error});
}
