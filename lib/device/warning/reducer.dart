import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<WarningState> buildReducer() {
  return asReducer(
    <Object, Reducer<WarningState>>{
      WarningAction.init: _onAction,
    },
  );
}

WarningState _onAction(WarningState state, Action action) {
  WarningState newState = state.clone();
  newState.model = action.payload;
  return newState;
}
