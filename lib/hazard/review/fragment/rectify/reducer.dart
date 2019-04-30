import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<RectifyInfoFragState> buildReducer() {
  return asReducer(
    <Object, Reducer<RectifyInfoFragState>>{
      RectifyInfoFragAction.action: _onAction,
    },
  );
}

RectifyInfoFragState _onAction(RectifyInfoFragState state, Action action) {
  final RectifyInfoFragState newState = state.clone();
  return newState;
}
