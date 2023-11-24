import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial());

  @override
  Stream<LoginState> mapEventToState(
    LoginEvent event,
  ) async* {
    if (event is RefreshEvent) {
      yield RefreshState();
    } else if (event is LoginUser) {
      yield LoadingState();
      FirebaseAuth.instance.signInWithEmailAndPassword(
          email: event.username, password: event.password);

      yield LoginSuccess();
    } else if (event is SignUpUser) {
      yield LoadingState();
      FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: event.email, password: event.password);

      yield SignUpSuccess();
    }
  }
}
