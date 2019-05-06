import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:inspection/mine/profile/page.dart';
import 'package:inspection/mine/recheck/page.dart';
import 'package:inspection/mine/rectify/page.dart';
import 'package:inspection/mine/report/page.dart';
import 'package:inspection/mine/task/page.dart';
import 'package:inspection/setting/page.dart';

import 'action.dart';
import 'state.dart';

Effect<MineState> buildEffect() {
  return combineEffects(<Object, Effect<MineState>>{
    MineAction.action: _onAction,
    MineAction.userInfo: _onSkipUserInfo,
    MineAction.task: _onSkipMineTask,
    MineAction.report: _onSkipMineReport,
    MineAction.rectify: _onSkipMineRectify,
    MineAction.recheck: _onSkipMineRecheck,
    MineAction.setting: _onSkipSetting,
  });
}

void _onAction(Action action, Context<MineState> ctx) {}

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
    return ReportPage().buildPage(null);
  }));
}

void _onSkipMineRectify(Action action, Context<MineState> ctx) {
  Navigator.of(ctx.context).push(MaterialPageRoute(builder: (context) {
    return RectifyPage().buildPage(null);
  }));
}

void _onSkipMineRecheck(Action action, Context<MineState> ctx) {
  Navigator.of(ctx.context).push(MaterialPageRoute(builder: (context) {
    return RecheckPage().buildPage(null);
  }));
}

void _onSkipSetting(Action action, Context<MineState> ctx) {
  Navigator.of(ctx.context).push(MaterialPageRoute(builder: (context) {
    return SettingPage().buildPage(null);
  }));
}
