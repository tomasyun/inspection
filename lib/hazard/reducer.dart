import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<HazardState> buildReducer() {
  return asReducer(
    <Object, Reducer<HazardState>>{
      HazardAction.init: _onAction,
    },
  );
}

HazardState _onAction(HazardState state, Action action) {
  HazardState newState = state.clone();
  newState.list = action.payload;
  return newState;
}
