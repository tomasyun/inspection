import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Effect<ContentState> buildEffect() {
  return combineEffects(<Object, Effect<ContentState>>{
    ContentAction.action: _onAction,
  });
}

void _onAction(Action action, Context<ContentState> ctx) {}
