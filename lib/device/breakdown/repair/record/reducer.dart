import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<RecordState> buildReducer() {
  return asReducer(
    <Object, Reducer<RecordState>>{
      RecordAction.action: _onAction,
    },
  );
}

RecordState _onAction(RecordState state, Action action) {
  RecordState newState = state.clone();
  newState.datalist = action.payload;
  return newState;
}
