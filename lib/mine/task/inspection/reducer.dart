import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<InspectionTaskState> buildReducer() {
  return asReducer(
    <Object, Reducer<InspectionTaskState>>{
      InspectionTaskAction.action: _onAction,
    },
  );
}

InspectionTaskState _onAction(InspectionTaskState state, Action action) {
  final InspectionTaskState newState = state.clone();
  return newState;
}
