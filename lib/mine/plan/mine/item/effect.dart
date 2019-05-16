import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:inspection/entity/plan_model.dart';
import 'package:inspection/mine/plan/manage/about/page.dart';

import 'action.dart';

Effect<PlanModel> buildEffect() {
  return combineEffects(<Object, Effect<PlanModel>>{
    MinePlanItemAction.action: _onAction,
    MinePlanItemAction.skipAbout: _onSkipAbout,
  });
}

void _onAction(Action action, Context<PlanModel> ctx) {}
void _onSkipAbout(Action action, Context<PlanModel> ctx) {
  Navigator.of(ctx.context).push(MaterialPageRoute(builder: (context) {
    return PlanAboutPage().buildPage(null);
  }));
}
