import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<TaskState> buildReducer() {
  return asReducer(
    <Object, Reducer<TaskState>>{
      TaskAction.action: _onAction,
    },
  );
}

TaskState _onAction(TaskState state, Action action) {
  final TaskState newState = state.clone();
  return newState;
}
