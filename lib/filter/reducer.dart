import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<FilterState> buildReducer() {
  return asReducer(
    <Object, Reducer<FilterState>>{
      FilterAction.action: _onAction,
    },
  );
}

FilterState _onAction(FilterState state, Action action) {
  FilterState newState = state.clone();
  return newState;
}
