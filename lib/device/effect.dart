import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Effect<DeviceState> buildEffect() {
  return combineEffects(<Object, Effect<DeviceState>>{
    DeviceAction.action: _onAction,
  });
}

void _onAction(Action action, Context<DeviceState> ctx) {}
