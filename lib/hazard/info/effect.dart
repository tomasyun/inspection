import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:inspection/global/dico_http.dart';
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
    Lifecycle.initState: _init,
    HazardInfoAction.skipRectifyCostApply: _onSkipRectifyCostApply,
    HazardInfoAction.skipRectifyInfo: _onSkipRectifyInfo,
    HazardInfoAction.skipRectifyReport: _onSkipRectifyReport,
    HazardInfoAction.skipRecheckReport: _onSkipRecheckReport,
    HazardInfoAction.skipHazardAllInfo: _onSkipHazardAllInfo
  });
}

void _onAction(Action action, Context<HazardInfoState> ctx) {}

void _init(Action action, Context<HazardInfoState> ctx) {
  DicoHttpRepository.doGetHazardInfoRequest(ctx.state.id).then((model) {
//    if (model.code == 0) {
//      ctx.dispatch(HazardInfoActionCreator.onGetHazardInfoAction(model));
//    }
    ctx.dispatch(HazardInfoActionCreator.onGetHazardInfoAction(model));
  });
}

void _onSkipRectifyReport(Action action, Context<HazardInfoState> ctx) {
  Map<String, dynamic> map = Map();
  map['id'] = ctx.state.id;
  Navigator.of(ctx.context).push(MaterialPageRoute(builder: (content) {
    return RectifyReportPage().buildPage(map);
  }));
}

void _onSkipRectifyInfo(Action action, Context<HazardInfoState> ctx) {
  Map<String, dynamic> map = Map();
  map['id'] = ctx.state.id;
  Navigator.of(ctx.context).push(MaterialPageRoute(builder: (content) {
    return RectifyInfoPage().buildPage(map);
  }));
}

void _onSkipRectifyCostApply(Action action, Context<HazardInfoState> ctx) {
  Navigator.of(ctx.context).push(MaterialPageRoute(builder: (content) {
    return CostApplyPage().buildPage(null);
  }));
}

void _onSkipRecheckReport(Action action, Context<HazardInfoState> ctx) {
  Map<String, dynamic> map = Map();
  map['id'] = ctx.state.id;
  Navigator.of(ctx.context).push(MaterialPageRoute(builder: (content) {
    return RecheckReportPage().buildPage(map);
  }));
}

void _onSkipHazardAllInfo(Action action, Context<HazardInfoState> ctx) {
  Map<String, dynamic> map = Map();
  map['id'] = ctx.state.id;
  Navigator.of(ctx.context).push(MaterialPageRoute(builder: (content) {
    return ReviewPage().buildPage(map);
  }));
}
