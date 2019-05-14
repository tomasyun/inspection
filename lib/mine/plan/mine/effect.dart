import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Effect<MinePlanState> buildEffect() {
  return combineEffects(<Object, Effect<MinePlanState>>{
    MinePlanAction.action: _onAction,
  });
}

void _onAction(Action action, Context<MinePlanState> ctx) {}
