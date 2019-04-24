import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<HazardInfoState> buildReducer() {
  return asReducer(
    <Object, Reducer<HazardInfoState>>{
      HazardInfoAction.action: _onAction,
    },
  );
}

HazardInfoState _onAction(HazardInfoState state, Action action) {
  final HazardInfoState newState = state.clone();
  return newState;
}
