import 'package:fish_redux/fish_redux.dart';
import 'package:inspection/device/repair/record/action.dart';
import 'package:inspection/device/repair/record/state.dart';

Reducer<RecordState> buildReducer() {
  return asReducer(
    <Object, Reducer<RecordState>>{
      RecordAction.action: _onAction,
    },
  );
}

RecordState _onAction(RecordState state, Action action) {
  RecordState newState = state.clone();
  newState.list = action.payload;
  return newState;
}
