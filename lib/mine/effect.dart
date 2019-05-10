import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:inspection/mine/hazard/page.dart';
import 'package:inspection/mine/profile/page.dart';
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
    MineAction.setting: _onSkipSetting,
    MineAction.hazardHistory: _onSkipHazardHistory,
  });
}

void _onAction(Action action, Context<MineState> ctx) {}

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
