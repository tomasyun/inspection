import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:inspection/device/page.dart';
import 'package:inspection/hazard/page.dart';

import 'action.dart';
import 'state.dart';

Effect<FunctionState> buildEffect() {
  return combineEffects(<Object, Effect<FunctionState>>{
    FunctionAction.action: _onAction,
    FunctionAction.scanQRCode: _onDeviceScanQRCode,
    FunctionAction.warning: _onDeviceWarning,
    FunctionAction.brokenReport: _onBrokenReport,
    FunctionAction.hazardReport: _onHazardReport,
    FunctionAction.hazardReview: _onHazardReview,
    FunctionAction.inspectionPlan: _onInspectionPlan,
    FunctionAction.task: _onMineTask
  });
}

void _onAction(Action action, Context<FunctionState> ctx) {}

void _onDeviceScanQRCode(Action action, Context<FunctionState> ctx) {
  Navigator.of(ctx.context).push(MaterialPageRoute(builder: (context) {
    return DevicePage().buildPage(null);
  }));
}

void _onDeviceWarning(Action action, Context<FunctionState> ctx) {}

void _onBrokenReport(Action action, Context<FunctionState> ctx) {}

void _onHazardReport(Action action, Context<FunctionState> ctx) {}

void _onHazardReview(Action action, Context<FunctionState> ctx) {
  Navigator.of(ctx.context).push(MaterialPageRoute(builder: (context) {
    return HazardPage().buildPage(null);
  }));
}

void _onInspectionPlan(Action action, Context<FunctionState> ctx) {}

void _onMineTask(Action action, Context<FunctionState> ctx) {}
