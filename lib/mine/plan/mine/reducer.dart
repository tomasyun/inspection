import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<MinePlanState> buildReducer() {
  return asReducer(
    <Object, Reducer<MinePlanState>>{
      MinePlanAction.action: _onAction,
      MinePlanAction.plans: _onGetMinePlans,
    },
  );
}

MinePlanState _onAction(MinePlanState state, Action action) {
  final MinePlanState newState = state.clone();
  return newState;
}

MinePlanState _onGetMinePlans(MinePlanState state, Action action) {
  MinePlanState newState = state.clone();
  newState.model = action.payload;
  return newState;
}
