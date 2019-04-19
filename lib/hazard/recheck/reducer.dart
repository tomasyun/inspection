import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<RecheckState> buildReducer() {
  return asReducer(
    <Object, Reducer<RecheckState>>{
      RecheckAction.action: _onAction,
    },
  );
}

RecheckState _onAction(RecheckState state, Action action) {
  final RecheckState newState = state.clone();
  return newState;
}
