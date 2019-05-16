import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<FilterState> buildReducer() {
  return asReducer(
    <Object, Reducer<FilterState>>{
      FilterAction.action: _onAction,
      FilterAction.levels: _onGetLevels,
      FilterAction.types: _onGetTypes,
      FilterAction.context: _onInitContext,
      FilterAction.departs: _onGetDeparts,
      FilterAction.applicants: _onGetApplicants
    },
  );
}

FilterState _onAction(FilterState state, Action action) {
  FilterState newState = state.clone();
  return newState;
}

FilterState _onGetLevels(FilterState state, Action action) {
  FilterState newState = state.clone();
  newState.levelModel = action.payload;
  return newState;
}

FilterState _onGetTypes(FilterState state, Action action) {
  FilterState newState = state.clone();
  newState.typeModel = action.payload;
  return newState;
}

FilterState _onGetDeparts(FilterState state, Action action) {
  FilterState newState = state.clone();
  newState.departs = action.payload;
  return newState;
}

FilterState _onGetApplicants(FilterState state, Action action) {
  FilterState newState = state.clone();
  newState.applicants = action.payload;
  return newState;
}

FilterState _onInitContext(FilterState state, Action action) {
  FilterState newState = state.clone();
  newState.context = action.payload;
  return newState;
}
