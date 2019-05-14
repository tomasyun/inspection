import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:inspection/device/info/page.dart';
import 'package:inspection/device/warning/page.dart';
import 'package:inspection/function/analyse/page.dart';
import 'package:inspection/hazard/page.dart';
import 'package:inspection/mine/plan/manage/page.dart';
import 'package:inspection/mine/plan/mine/page.dart';

import 'action.dart';
import 'state.dart';

Effect<FunctionState> buildEffect() {
  return combineEffects(<Object, Effect<FunctionState>>{
    FunctionAction.action: _onAction,
    FunctionAction.scanQRCode: _onDeviceScanQRCode,
    FunctionAction.warning: _onDeviceWarning,
    FunctionAction.hazardReview: _onHazardReview,
    FunctionAction.inspectionPlan: _onInspectionPlan,
    FunctionAction.minePlan: _onSkipMinePlan,
    FunctionAction.analyse: _onSkipSaveAnalyse,
  });
}

void _onAction(Action action, Context<FunctionState> ctx) {}
void _onSkipSaveAnalyse(Action action, Context<FunctionState> ctx) {
  Navigator.of(ctx.context).push(MaterialPageRoute(builder: (context) {
    return SaveAnalysePage().buildPage(null);
  }));
}

void _onSkipMinePlan(Action action, Context<FunctionState> ctx) {
  Navigator.of(ctx.context).push(MaterialPageRoute(builder: (context) {
    return MinePlanPage().buildPage(null);
  }));
}

void _onDeviceScanQRCode(Action action, Context<FunctionState> ctx) {
  Navigator.of(ctx.context).push(MaterialPageRoute(builder: (context) {
    return InfoPage().buildPage(null);
  }));
}

void _onDeviceWarning(Action action, Context<FunctionState> ctx) {
  Navigator.of(ctx.context).push(MaterialPageRoute(builder: (context) {
    return WarningPage().buildPage(null);
  }));
}

void _onHazardReview(Action action, Context<FunctionState> ctx) {
  Navigator.of(ctx.context).push(MaterialPageRoute(builder: (context) {
    return HazardPage().buildPage(null);
  }));
}

void _onInspectionPlan(Action action, Context<FunctionState> ctx) {
  Navigator.of(ctx.context).push(MaterialPageRoute(builder: (context) {
    return InspectPlanPage().buildPage(null);
  }));
}
