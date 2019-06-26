import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<FilterState> buildReducer() {
  return asReducer(
    <Object, Reducer<FilterState>>{
      FilterAction.action: _onAction,
      FilterAction.model: _onGetFilterModel,
      FilterAction.context: _onInitContext,
    },
  );
}

FilterState _onAction(
  FilterState state,
  Action action,
) {
  FilterState newState = state.clone();
  return newState;
}

FilterState _onGetFilterModel(
  FilterState state,
  Action action,
) {
  FilterState newState = state.clone();
  newState.model = action.payload;
  return newState;
}

FilterState _onInitContext(
  FilterState state,
  Action action,
) {
  FilterState newState = state.clone();
  newState.context = action.payload;
  return newState;
}
