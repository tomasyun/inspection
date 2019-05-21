import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<RecheckInfoFragState> buildReducer() {
  return asReducer(
    <Object, Reducer<RecheckInfoFragState>>{
      RecheckInfoFragAction.action: _onAction,
    },
  );
}

RecheckInfoFragState _onAction(RecheckInfoFragState state, Action action) {
  final RecheckInfoFragState newState = state.clone();
  return newState;
}
