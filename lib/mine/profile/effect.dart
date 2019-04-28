import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Effect<ProfileState> buildEffect() {
  return combineEffects(<Object, Effect<ProfileState>>{
    ProfileAction.action: _onAction,
  });
}

void _onAction(Action action, Context<ProfileState> ctx) {}
