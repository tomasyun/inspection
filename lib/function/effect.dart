import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:inspection/device/info/page.dart';
import 'package:inspection/device/repair/report/page.dart';
import 'package:inspection/device/warning/page.dart';
import 'package:inspection/hazard/page.dart';
import 'package:inspection/hazard/recheck/report/page.dart';
import 'package:inspection/hazard/rectify/apply/page.dart';
import 'package:inspection/hazard/rectify/report/page.dart';
import 'package:inspection/hazard/report/page.dart';

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
    FunctionAction.task: _onMineTask,
    FunctionAction.hazardRecheck: _onHazardRecheck,
    FunctionAction.costApply: _onCostApply,
    FunctionAction.rectifyReport: _onRectifyReport
  });
}

void _onAction(Action action, Context<FunctionState> ctx) {}

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

void _onBrokenReport(Action action, Context<FunctionState> ctx) {
  Navigator.of(ctx.context).push(MaterialPageRoute(builder: (context) {
    return ReportPage().buildPage(null);
  }));
}

void _onHazardReport(Action action, Context<FunctionState> ctx) {
  Navigator.of(ctx.context).push(MaterialPageRoute(builder: (context) {
    return HazardReportPage().buildPage(null);
  }));
}

void _onHazardReview(Action action, Context<FunctionState> ctx) {
  Navigator.of(ctx.context).push(MaterialPageRoute(builder: (context) {
    return HazardPage().buildPage(null);
  }));
}

void _onInspectionPlan(Action action, Context<FunctionState> ctx) {}

void _onMineTask(Action action, Context<FunctionState> ctx) {}

void _onHazardRecheck(Action action, Context<FunctionState> ctx) {
  Navigator.of(ctx.context).push(MaterialPageRoute(builder: (context) {
    return RecheckReportPage().buildPage(null);
  }));
}

void _onCostApply(Action action, Context<FunctionState> ctx) {
  Navigator.of(ctx.context).push(MaterialPageRoute(builder: (context) {
    return CostApplyPage().buildPage(null);
  }));
}

void _onRectifyReport(Action action, Context<FunctionState> ctx) {
  Navigator.of(ctx.context).push(MaterialPageRoute(builder: (context) {
    return RectifyReportPage().buildPage(null);
  }));
}
