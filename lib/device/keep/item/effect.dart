import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Effect<RecordItemState> buildEffect() {
  return combineEffects(<Object, Effect<RecordItemState>>{
    RecordItemAction.action: _onAction,
  });
}

void _onAction(Action action, Context<RecordItemState> ctx) {}
