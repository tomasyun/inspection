import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<HazardInfoFragState> buildReducer() {
  return asReducer(
    <Object, Reducer<HazardInfoFragState>>{
      HazardInfoFragAction.action: _onAction,
      HazardInfoFragAction.model: _onGetHazardModel,
    },
  );
}

HazardInfoFragState _onAction(
  HazardInfoFragState state,
  Action action,
) {
  final HazardInfoFragState newState = state.clone();
  return newState;
}

HazardInfoFragState _onGetHazardModel(
    HazardInfoFragState state, Action action) {
  HazardInfoFragState newState = state.clone();
  newState.model = action.payload;
  return newState;
}
