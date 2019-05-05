import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:inspection/device/keep/page.dart';
import 'package:inspection/device/repair/record/page.dart';

import 'action.dart';
import 'state.dart';

Effect<InfoState> buildEffect() {
  return combineEffects(<Object, Effect<InfoState>>{
    InfoAction.action: _onAction,
    InfoAction.repairRecord: _onSkipRepairRecord,
    InfoAction.keepRecord: _onSkipKeepRecord,
  });
}

void _onAction(Action action, Context<InfoState> ctx) {}

void _onSkipRepairRecord(Action action, Context<InfoState> ctx) {
  Navigator.of(ctx.context).push(MaterialPageRoute(builder: (context) {
    return RecordPage().buildPage(null);
  }));
}

void _onSkipKeepRecord(Action action, Context<InfoState> ctx) {
  Navigator.of(ctx.context).push(MaterialPageRoute(builder: (context) {
    return KeepPage().buildPage(null);
  }));
}
