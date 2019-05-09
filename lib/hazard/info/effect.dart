import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:inspection/hazard/recheck/page.dart';
import 'package:inspection/hazard/rectify/apply/page.dart';
import 'package:inspection/hazard/rectify/info/page.dart';
import 'package:inspection/hazard/rectify/report/page.dart';
import 'package:inspection/hazard/review/page.dart';

import 'action.dart';
import 'state.dart';

Effect<HazardInfoState> buildEffect() {
  return combineEffects(<Object, Effect<HazardInfoState>>{
    HazardInfoAction.action: _onAction,
    HazardInfoAction.skipRectifyCostApply: _onSkipRectifyCostApply,
    HazardInfoAction.skipRectifyInfo: _onSkipRectifyInfo,
    HazardInfoAction.skipRectifyReport: _onSkipRectifyReport,
    HazardInfoAction.skipRecheckReport: _onSkipRecheckReport,
    HazardInfoAction.skipHazardAllInfo: _onSkipHazardAllInfo
  });
}

void _onAction(Action action, Context<HazardInfoState> ctx) {}

void _onSkipRectifyReport(Action action, Context<HazardInfoState> ctx) {
  Navigator.of(ctx.context).push(MaterialPageRoute(builder: (content) {
    return RectifyReportPage().buildPage(null);
  }));
}

void _onSkipRectifyInfo(Action action, Context<HazardInfoState> ctx) {
  Navigator.of(ctx.context).push(MaterialPageRoute(builder: (content) {
    return RectifyInfoPage().buildPage(null);
  }));
}

void _onSkipRectifyCostApply(Action action, Context<HazardInfoState> ctx) {
  Navigator.of(ctx.context).push(MaterialPageRoute(builder: (content) {
    return CostApplyPage().buildPage(null);
  }));
}

void _onSkipRecheckReport(Action action, Context<HazardInfoState> ctx) {
  Navigator.of(ctx.context).push(MaterialPageRoute(builder: (content) {
    return RecheckReportPage().buildPage(null);
  }));
}

void _onSkipHazardAllInfo(Action action, Context<HazardInfoState> ctx) {
  Navigator.of(ctx.context).push(MaterialPageRoute(builder: (content) {
    return ReviewPage().buildPage(null);
  }));
}
