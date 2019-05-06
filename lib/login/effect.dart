import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:inspection/index/page.dart';

import 'action.dart';
import 'state.dart';

Effect<LoginState> buildEffect() {
  return combineEffects(<Object, Effect<LoginState>>{
    LoginAction.action: _onAction,
    LoginAction.login: _onLogin,
  });
}

void _onAction(Action action, Context<LoginState> ctx) {}
void _onLogin(Action action, Context<LoginState> ctx) {
  Navigator.of(ctx.context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) => IndexPage().buildPage(null)),
      (route) => route == null);
}
