import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:inspection/global/sharedpreferences.dart';
import 'package:inspection/mine/hazard/page.dart';
import 'package:inspection/mine/profile/page.dart';
import 'package:inspection/mine/report/page.dart';
import 'package:inspection/mine/task/page.dart';
import 'package:inspection/mine/updatepassword/page.dart';
import 'package:inspection/setting/page.dart';

import 'action.dart';
import 'state.dart';

Effect<MineState> buildEffect() {
  return combineEffects(<Object, Effect<MineState>>{
    MineAction.action: _onAction,
    MineAction.userInfo: _onSkipUserInfo,
    MineAction.task: _onSkipMineTask,
    MineAction.report: _onSkipMineReport,
    MineAction.setting: _onSkipSetting,
    MineAction.hazardHistory: _onSkipHazardHistory,
    MineAction.upgradePassword: _onUpdatePasswordAction,
    Lifecycle.initState: _onGetUserBaseInfo,
  });
}

void _onAction(Action action, Context<MineState> ctx) {}

void _onGetUserBaseInfo(Action action, Context<MineState> ctx) async {
  Map<String, String> map = Map();
  map['userName'] = '张三';
  map['company'] = '陕西缔科网络科技有限公司';
  map['avatar'] = '';
  await SpUtils().getString('name').then((value) {
    map['userName'] = value;
  });

  await SpUtils().getString('company').then((value) {
    map['company'] = value;
  });
  await SpUtils().getString('avatar').then((value) {
    map['avatar'] = value;
  });
  ctx.dispatch(MineActionCreator.onGetUserInfo(map));
}

void _onUpdatePasswordAction(Action action, Context<MineState> ctx) {
  Navigator.of(ctx.context).push(MaterialPageRoute(builder: (context) {
    return UpdatePasswordPage().buildPage(null);
  }));
}

void _onSkipHazardHistory(Action action, Context<MineState> ctx) {
  Navigator.of(ctx.context).push(MaterialPageRoute(builder: (context) {
    return HazardHistoryPage().buildPage(null);
  }));
}

void _onSkipUserInfo(Action action, Context<MineState> ctx) {
  Navigator.of(ctx.context).push(MaterialPageRoute(builder: (context) {
    return ProfilePage().buildPage(null);
  }));
}

void _onSkipMineTask(Action action, Context<MineState> ctx) {
  Navigator.of(ctx.context).push(MaterialPageRoute(builder: (context) {
    return TaskPage().buildPage(null);
  }));
}

void _onSkipMineReport(Action action, Context<MineState> ctx) {
  Navigator.of(ctx.context).push(MaterialPageRoute(builder: (context) {
    return ReportRecordPage().buildPage(null);
  }));
}

void _onSkipSetting(Action action, Context<MineState> ctx) {
  Navigator.of(ctx.context).push(MaterialPageRoute(builder: (context) {
    return SettingPage().buildPage(null);
  }));
}
