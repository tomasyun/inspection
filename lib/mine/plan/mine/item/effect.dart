import 'package:fish_redux/fish_redux.dart';
import 'package:inspection/entity/plan_model.dart';

import 'action.dart';

Effect<PlanModel> buildEffect() {
  return combineEffects(<Object, Effect<PlanModel>>{
    MinePlanItemAction.action: _onAction,
  });
}

void _onAction(Action action, Context<PlanModel> ctx) {}
