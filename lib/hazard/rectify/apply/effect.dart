import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Effect<CostApplyState> buildEffect() {
  return combineEffects(<Object, Effect<CostApplyState>>{
    CostApplyAction.action: _onAction,
  });
}

void _onAction(Action action, Context<CostApplyState> ctx) {}
