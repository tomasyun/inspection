import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Effect<HazardInfoFragState> buildEffect() {
  return combineEffects(<Object, Effect<HazardInfoFragState>>{
    HazardInfoFragAction.action: _onAction,
  });
}

void _onAction(Action action, Context<HazardInfoFragState> ctx) {}
