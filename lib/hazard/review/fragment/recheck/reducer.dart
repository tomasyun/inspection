import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<RecheckInfoFragState> buildReducer() {
  return asReducer(
    <Object, Reducer<RecheckInfoFragState>>{
      RecheckInfoFragAction.action: _onAction,
      RecheckInfoFragAction.model: _onGetRecheckInfoModel,
    },
  );
}

RecheckInfoFragState _onAction(RecheckInfoFragState state, Action action) {
  final RecheckInfoFragState newState = state.clone();
  return newState;
}

RecheckInfoFragState _onGetRecheckInfoModel(
    RecheckInfoFragState state, Action action) {
  RecheckInfoFragState newState = state.clone();
  newState.model = action.payload;
  return newState;
}
