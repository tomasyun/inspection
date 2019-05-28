import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

class LoginState implements Cloneable<LoginState> {
  TextEditingController userNameController;
  TextEditingController passwordController;
  bool isClose = true;

  @override
  LoginState clone() {
    return LoginState()
      ..userNameController = userNameController
      ..passwordController = passwordController
      ..isClose = isClose;
  }
}

LoginState initState(Map<String, dynamic> args) {
  LoginState state = LoginState();
  state.userNameController = TextEditingController();
  state.passwordController = TextEditingController();
  state.isClose = true;
  return state;
}
