import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Effect<ReviewInfoFragState> buildEffect() {
  return combineEffects(<Object, Effect<ReviewInfoFragState>>{
    ReviewInfoFragAction.action: _onAction,
  });
}

void _onAction(Action action, Context<ReviewInfoFragState> ctx) {}
