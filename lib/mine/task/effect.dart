import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Effect<TaskState> buildEffect() {
  return combineEffects(<Object, Effect<TaskState>>{
    TaskAction.action: _onAction,
  });
}

void _onAction(Action action, Context<TaskState> ctx) {}
