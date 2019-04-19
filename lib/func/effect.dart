import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Effect<FunctionState> buildEffect() {
  return combineEffects(<Object, Effect<FunctionState>>{
    FunctionAction.action: _onAction,
  });
}

void _onAction(Action action, Context<FunctionState> ctx) {}
