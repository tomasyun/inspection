import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Effect<InspectPlanState> buildEffect() {
  return combineEffects(<Object, Effect<InspectPlanState>>{
    InspectPlanAction.action: _onAction,
  });
}

void _onAction(Action action, Context<InspectPlanState> ctx) {}
