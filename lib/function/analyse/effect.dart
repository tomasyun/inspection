import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Effect<SaveAnalyseState> buildEffect() {
  return combineEffects(<Object, Effect<SaveAnalyseState>>{
    SaveAnalyseAction.action: _onAction,
  });
}

void _onAction(
  Action action,
  Context<SaveAnalyseState> ctx,
) {}
