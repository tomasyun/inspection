import 'package:fish_redux/fish_redux.dart';
import 'package:inspection/entity/plan_about_model.dart';

import 'action.dart';

Effect<PlanAboutModel> buildEffect() {
  return combineEffects(<Object, Effect<PlanAboutModel>>{
    PlanAboutItemAction.action: _onAction,
  });
}

void _onAction(Action action, Context<PlanAboutModel> ctx) {}
