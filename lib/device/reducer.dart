import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<DeviceState> buildReducer() {
  return asReducer(
    <Object, Reducer<DeviceState>>{
      DeviceAction.action: _onAction,
    },
  );
}

DeviceState _onAction(DeviceState state, Action action) {
  final DeviceState newState = state.clone();
  return newState;
}
