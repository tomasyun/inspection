import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:inspection/entity/hazard_model.dart';
import 'package:inspection/hazard/info/page.dart';

import 'action.dart';

Effect<HazardModel> buildEffect() {
  return combineEffects(<Object, Effect<HazardModel>>{
    HazardItemAction.action: _onAction,
    HazardItemAction.skipInfo: _onSkipInfo
  });
}

void _onAction(Action action, Context<HazardModel> ctx) {}

void _onSkipInfo(Action action, Context<HazardModel> ctx) {
  Navigator.of(ctx.context).push(MaterialPageRoute(builder: (content) {
    Map<String, dynamic> map = {'state': ctx.state.state};
    return HazardInfoPage().buildPage(map);
  }));
}
