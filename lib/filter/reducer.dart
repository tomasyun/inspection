import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<FilterState> buildReducer() {
  return asReducer(
    <Object, Reducer<FilterState>>{
      FilterAction.action: _onAction,
      FilterAction.levels: _onGetLevels
    },
  );
}

FilterState _onAction(FilterState state, Action action) {
  FilterState newState = state.clone();
  return newState;
}

FilterState _onGetLevels(FilterState state, Action action) {
  FilterState newState = state.clone();
  newState.levels = action.payload;
  return newState;
}
