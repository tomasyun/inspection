import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:inspection/global/toast.dart';
import 'package:inspection/mine/updatepassword/page.dart';

import 'action.dart';
import 'state.dart';

Effect<SettingState> buildEffect() {
  return combineEffects(<Object, Effect<SettingState>>{
    SettingAction.action: _onAction,
    SettingAction.upgradePassword: _onSkipUpgradePassword,
    SettingAction.upgradeVersion: _onUpgradeVersion,
    SettingAction.logout: _onLogout,
  });
}

void _onAction(Action action, Context<SettingState> ctx) {}

void _onSkipUpgradePassword(Action action, Context<SettingState> ctx) {
  Navigator.of(ctx.context).push(MaterialPageRoute(builder: (context) {
    return UpdatePasswordPage().buildPage(null);
  }));
}

void _onUpgradeVersion(Action action, Context<SettingState> ctx) {
  AppToast.showToast('当前版本为最新版本');
}

void _onLogout(Action action, Context<SettingState> ctx) {
  AppToast.showToast('暂未实现');
}
