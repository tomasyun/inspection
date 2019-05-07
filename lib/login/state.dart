import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

class LoginState implements Cloneable<LoginState> {
  TextEditingController userNameController;
  TextEditingController passwordController;

  @override
  LoginState clone() {
    return LoginState()
      ..userNameController = userNameController
      ..passwordController = passwordController;
  }
}

LoginState initState(Map<String, dynamic> args) {
  LoginState state = LoginState();
  state.userNameController = TextEditingController();
  state.passwordController = TextEditingController();
  return state;
}
