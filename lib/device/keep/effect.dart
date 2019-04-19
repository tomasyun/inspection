import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Effect<KeepState> buildEffect() {
  return combineEffects(<Object, Effect<KeepState>>{
    KeepAction.action: _onAction,
  });
}

void _onAction(Action action, Context<KeepState> ctx) {}
