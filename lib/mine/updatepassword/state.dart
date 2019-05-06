import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

class UpdatePasswordState implements Cloneable<UpdatePasswordState> {
  TextEditingController oldPasswordController;
  TextEditingController newPasswordController;
  TextEditingController againPasswordController;

  @override
  UpdatePasswordState clone() {
    return UpdatePasswordState()
      ..oldPasswordController = oldPasswordController
      ..newPasswordController = newPasswordController
      ..againPasswordController = againPasswordController;
  }
}

UpdatePasswordState initState(Map<String, dynamic> args) {
  UpdatePasswordState state = UpdatePasswordState();
  state.oldPasswordController = TextEditingController();
  state.newPasswordController = TextEditingController();
  state.againPasswordController = TextEditingController();
  return state;
}
