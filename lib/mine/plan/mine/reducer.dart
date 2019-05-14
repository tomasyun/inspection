import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<MinePlanState> buildReducer() {
  return asReducer(
    <Object, Reducer<MinePlanState>>{
      MinePlanAction.action: _onAction,
    },
  );
}

MinePlanState _onAction(MinePlanState state, Action action) {
  final MinePlanState newState = state.clone();
  return newState;
}
