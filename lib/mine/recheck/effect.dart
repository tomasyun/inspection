import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Effect<RecheckState> buildEffect() {
  return combineEffects(<Object, Effect<RecheckState>>{
    RecheckAction.action: _onAction,
  });
}

void _onAction(Action action, Context<RecheckState> ctx) {}
