import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:inspection/global/app_common.dart';
import 'package:inspection/global/dico_http.dart';
import 'package:inspection/global/sharedpreferences.dart';
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
//  if (ctx.state.userNameController.text.isEmpty) {
//    AppToast.showToast('用户名不能为空');
//  } else if (ctx.state.passwordController.text.isEmpty) {
//    AppToast.showToast('密码不能空');
//  } else {
  Map<String, String> map = Map();
  map['username'] = 'system';
  map['password'] = '111111';
  DicoHttpRepository.userLogin(map).then((model) {
    if (model.code == 0) {
      AppCommons.showToast(model.msg);
      SpUtils sp = SpUtils();
      sp.putString('token', 'Bearer' + ' ${model.data.token}');
      sp.putString('name', '${model.data.name}');
      sp.putString('company', '${model.data.company}');
      sp.putString('avatar', '${model.data.icon}');
      sp.putInt('isLoginOk', 1);
      Navigator.of(ctx.context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => IndexPage().buildPage(null)),
          (route) => route == null);
    } else {
      AppCommons.showToast(model.msg);
    }
  });
//  }
}
