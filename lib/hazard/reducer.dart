import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<HazardState> buildReducer() {
  return asReducer(
    <Object, Reducer<HazardState>>{
      HazardAction.init: _onAction,
      HazardAction.startDate: _getStartDate,
      HazardAction.endDate: _getEndDate,
      HazardAction.state: _getHazardState,
    },
  );
}

HazardState _onAction(HazardState state, Action action) {
  HazardState newState = state.clone();
  newState.list = action.payload;
  return newState;
}

HazardState _getStartDate(HazardState state, Action action) {
  HazardState newState = state.clone();
  newState.startDate = action.payload;
  return newState;
}

HazardState _getEndDate(HazardState state, Action action) {
  HazardState newState = state.clone();
  newState.endDate = action.payload;
  return newState;
}

HazardState _getHazardState(HazardState state, Action action) {
  HazardState newState = state.clone();
  newState.state = action.payload;
  return newState;
}
