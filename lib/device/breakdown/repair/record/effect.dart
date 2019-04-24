import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Effect<RecordState> buildEffect() {
  return combineEffects(<Object, Effect<RecordState>>{
    RecordAction.action: _onAction,
  });
}

void _onAction(Action action, Context<RecordState> ctx) {}
