import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<LoginState> buildReducer() {
  return asReducer(
    <Object, Reducer<LoginState>>{
      LoginAction.action: _onAction,
      LoginAction.eyeState: _onGetEyeState,
    },
  );
}

LoginState _onAction(
  LoginState state,
  Action action,
) {
  final LoginState newState = state.clone();
  return newState;
}

LoginState _onGetEyeState(
  LoginState state,
  Action action,
) {
  LoginState newState = state.clone();
  newState.isClose = action.payload;
  return newState;
}
