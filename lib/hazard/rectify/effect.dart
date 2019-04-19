import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Effect<RectifyState> buildEffect() {
  return combineEffects(<Object, Effect<RectifyState>>{
    RectifyAction.action: _onAction,
  });
}

void _onAction(Action action, Context<RectifyState> ctx) {}
