import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Effect<DetailState> buildEffect() {
  return combineEffects(<Object, Effect<DetailState>>{
    DetailAction.action: _onAction,
  });
}

void _onAction(Action action, Context<DetailState> ctx) {}
