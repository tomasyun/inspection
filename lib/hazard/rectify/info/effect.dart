import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Effect<RectifyInfoState> buildEffect() {
  return combineEffects(<Object, Effect<RectifyInfoState>>{
    RectifyInfoAction.action: _onAction,
  });
}

void _onAction(Action action, Context<RectifyInfoState> ctx) {}
