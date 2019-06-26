import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<RectifyInfoFragState> buildReducer() {
  return asReducer(
    <Object, Reducer<RectifyInfoFragState>>{
      RectifyInfoFragAction.action: _onAction,
      RectifyInfoFragAction.model: _onGetRectifyInfoModel,
    },
  );
}

RectifyInfoFragState _onAction(
  RectifyInfoFragState state,
  Action action,
) {
  final RectifyInfoFragState newState = state.clone();
  return newState;
}

RectifyInfoFragState _onGetRectifyInfoModel(
    RectifyInfoFragState state, Action action) {
  RectifyInfoFragState newState = state.clone();
  newState.model = action.payload;
  return newState;
}
