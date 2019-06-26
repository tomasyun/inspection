import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<ProfileState> buildReducer() {
  return asReducer(
    <Object, Reducer<ProfileState>>{
      ProfileAction.action: _onAction,
      ProfileAction.userInfo: _onGetUserInfo,
    },
  );
}

ProfileState _onAction(
  ProfileState state,
  Action action,
) {
  final ProfileState newState = state.clone();
  return newState;
}

ProfileState _onGetUserInfo(
  ProfileState state,
  Action action,
) {
  ProfileState newState = state.clone();
  newState.model = action.payload;
  return newState;
}
