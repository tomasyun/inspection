import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<HazardHistoryState> buildReducer() {
  return asReducer(
    <Object, Reducer<HazardHistoryState>>{
      HazardHistoryAction.action: _onAction,
      HazardHistoryAction.init: _init,
    },
  );
}

HazardHistoryState _onAction(
  HazardHistoryState state,
  Action action,
) {
  final HazardHistoryState newState = state.clone();
  return newState;
}

HazardHistoryState _init(
  HazardHistoryState state,
  Action action,
) {
  HazardHistoryState newState = state.clone();
  newState.model = action.payload;
  return newState;
}
