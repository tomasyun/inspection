import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<RectifyState> buildReducer() {
  return asReducer(
    <Object, Reducer<RectifyState>>{
      RectifyAction.action: _onAction,
    },
  );
}

RectifyState _onAction(RectifyState state, Action action) {
  final RectifyState newState = state.clone();
  return newState;
}
