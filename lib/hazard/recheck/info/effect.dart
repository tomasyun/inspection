import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Effect<RecheckInfoState> buildEffect() {
  return combineEffects(<Object, Effect<RecheckInfoState>>{
    RecheckInfoAction.action: _onAction,
  });
}

void _onAction(Action action, Context<RecheckInfoState> ctx) {}
