import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<HazardInfoFragState> buildReducer() {
  return asReducer(
    <Object, Reducer<HazardInfoFragState>>{
      HazardInfoFragAction.action: _onAction,
    },
  );
}

HazardInfoFragState _onAction(HazardInfoFragState state, Action action) {
  final HazardInfoFragState newState = state.clone();
  return newState;
}
