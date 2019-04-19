import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<RepairState> buildReducer() {
  return asReducer(
    <Object, Reducer<RepairState>>{
      RepairAction.action: _onAction,
    },
  );
}

RepairState _onAction(RepairState state, Action action) {
  final RepairState newState = state.clone();
  return newState;
}
