import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Effect<HazardInfoState> buildEffect() {
  return combineEffects(<Object, Effect<HazardInfoState>>{
    HazardInfoAction.action: _onAction,
  });
}

void _onAction(Action action, Context<HazardInfoState> ctx) {}
