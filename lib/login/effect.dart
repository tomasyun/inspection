import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:inspection/global/app_common.dart';
import 'package:inspection/global/dico_http.dart';
import 'package:inspection/global/sharedpreferences.dart';
import 'package:inspection/index/page.dart';
import 'package:inspection/widget/loading_page.dart';

import 'action.dart';
import 'state.dart';

Effect<LoginState> buildEffect() {
  return combineEffects(<Object, Effect<LoginState>>{
    LoginAction.action: _onAction,
    LoginAction.login: _onLogin,
    LoginAction.switchEye: _onSwitchEyeAction,
  });
}

void _onAction(
  Action action,
  Context<LoginState> ctx,
) {}

void _onSwitchEyeAction(Action action, Context<LoginState> ctx) {
  ctx.dispatch(LoginActionCreator.onGetEyeStateAction(!ctx.state.isClose));
}

void _onLogin(
  Action action,
  Context<LoginState> ctx,
) {
  if (ctx.state.userNameController.text.isEmpty) {
    AppCommons.showToast('用户名不能为空');
  } else if (ctx.state.passwordController.text.isEmpty) {
    AppCommons.showToast('密码不能空');
  } else {
    Map<String, String> map = Map();
    map['username'] = ctx.state.userNameController.text;
    map['password'] = ctx.state.passwordController.text;
    LoadingPage loading = LoadingPage(ctx.context);
    loading.show();
    DicoHttpRepository.userLogin(map, () {
      loading.close();
    }).then((model) {
      loading.close();
      if (model.code == 0) {
        SpUtils sp = SpUtils();
        sp.putString('token', 'Bearer' + ' ${model.data.token}');
        sp.putString('name', '${model.data.name}');
        sp.putString('company', '${model.data.company}');
        sp.putString('avatar', '${model.data.icon}');
        sp.putInt('isLoginOk', 1);
        Navigator.of(ctx.context).pushAndRemoveUntil(
            MaterialPageRoute(
                builder: (context) => IndexPage().buildPage(null)),
            (route) => route == null);
      } else {
        AppCommons.showToast(model.msg);
      }
    });
  }
}
