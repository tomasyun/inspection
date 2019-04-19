import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<WarningState> buildReducer() {
  return asReducer(
    <Object, Reducer<WarningState>>{
      WarningAction.action: _onAction,
    },
  );
}

WarningState _onAction(WarningState state, Action action) {
  final WarningState newState = state.clone();
  return newState;
}
