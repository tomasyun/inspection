import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Effect<PlanAboutState> buildEffect() {
  return combineEffects(<Object, Effect<PlanAboutState>>{
    PlanAboutAction.action: _onAction,
    Lifecycle.initState: _onGetPlanAbouts,
  });
}

void _onAction(Action action, Context<PlanAboutState> ctx) {}

void _onGetPlanAbouts(Action action, Context<PlanAboutState> ctx) {
//  ctx.dispatch(PlanAboutActionCreator.onGetPlanAbouts(list));
}
