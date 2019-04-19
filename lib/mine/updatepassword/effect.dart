import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Effect<UpdatePasswordState> buildEffect() {
  return combineEffects(<Object, Effect<UpdatePasswordState>>{
    UpdatePasswordAction.action: _onAction,
  });
}

void _onAction(Action action, Context<UpdatePasswordState> ctx) {}
