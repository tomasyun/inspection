import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Effect<RectifyInfoFragState> buildEffect() {
  return combineEffects(<Object, Effect<RectifyInfoFragState>>{
    RectifyInfoFragAction.action: _onAction,
  });
}

void _onAction(Action action, Context<RectifyInfoFragState> ctx) {}
