import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:inspection/entity/plan_about_model.dart';
import 'package:inspection/mine/task/inspection/page.dart';

import 'action.dart';

Effect<PlanAboutModel> buildEffect() {
  return combineEffects(<Object, Effect<PlanAboutModel>>{
    PlanAboutItemAction.action: _onAction,
    PlanAboutItemAction.scanQRCode: _onScanQRCode,
  });
}

void _onAction(Action action, Context<PlanAboutModel> ctx) {}
void _onScanQRCode(Action action, Context<PlanAboutModel> ctx) {
  Navigator.of(ctx.context).push(MaterialPageRoute(builder: (content) {
    return InspectionTaskPage().buildPage(null);
  }));
}
