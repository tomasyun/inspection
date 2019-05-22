import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<KeepState> buildReducer() {
  return asReducer(
    <Object, Reducer<KeepState>>{
      KeepAction.action: _onAction,
    },
  );
}

KeepState _onAction(KeepState state, Action action) {
  KeepState newState = state.clone();
  newState.model = action.payload;
  return newState;
}
