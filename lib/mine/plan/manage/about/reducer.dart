import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<PlanAboutState> buildReducer() {
  return asReducer(
    <Object, Reducer<PlanAboutState>>{
      PlanAboutAction.action: _onAction,
      PlanAboutAction.planAbouts: _onGetPlanAbouts,
    },
  );
}

PlanAboutState _onAction(PlanAboutState state, Action action) {
  final PlanAboutState newState = state.clone();
  return newState;
}

PlanAboutState _onGetPlanAbouts(PlanAboutState state, Action action) {
  PlanAboutState newState = state.clone();
  newState.model = action.payload;
  return newState;
}
