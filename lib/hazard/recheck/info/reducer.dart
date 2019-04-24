import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<RecheckInfoState> buildReducer() {
  return asReducer(
    <Object, Reducer<RecheckInfoState>>{
      RecheckInfoAction.action: _onAction,
    },
  );
}

RecheckInfoState _onAction(RecheckInfoState state, Action action) {
  final RecheckInfoState newState = state.clone();
  return newState;
}
