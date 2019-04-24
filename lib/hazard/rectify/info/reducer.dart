import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<RectifyInfoState> buildReducer() {
  return asReducer(
    <Object, Reducer<RectifyInfoState>>{
      RectifyInfoAction.action: _onAction,
    },
  );
}

RectifyInfoState _onAction(RectifyInfoState state, Action action) {
  final RectifyInfoState newState = state.clone();
  return newState;
}
