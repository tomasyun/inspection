import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<HazardInfoState> buildReducer() {
  return asReducer(
    <Object, Reducer<HazardInfoState>>{
      HazardInfoAction.action: _onAction,
      HazardInfoAction.info: _onGetHazardInfo,
    },
  );
}

HazardInfoState _onAction(
  HazardInfoState state,
  Action action,
) {
  final HazardInfoState newState = state.clone();
  return newState;
}

HazardInfoState _onGetHazardInfo(
  HazardInfoState state,
  Action action,
) {
  HazardInfoState newState = state.clone();
  newState.model = action.payload;
  return newState;
}
