import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Effect<WarningState> buildEffect() {
  return combineEffects(<Object, Effect<WarningState>>{
    WarningAction.action: _onAction,
  });
}

void _onAction(Action action, Context<WarningState> ctx) {}
