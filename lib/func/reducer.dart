import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<FunctionState> buildReducer() {
  return asReducer(
    <Object, Reducer<FunctionState>>{
      FunctionAction.action: _onAction,
    },
  );
}

FunctionState _onAction(FunctionState state, Action action) {
  final FunctionState newState = state.clone();
  return newState;
}
