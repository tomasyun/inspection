import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<InspectionTaskState> buildReducer() {
  return asReducer(
    <Object, Reducer<InspectionTaskState>>{
      InspectionTaskAction.action: _onAction,
      InspectionTaskAction.model: _onGetInspectionTasks,
      InspectionTaskAction.deviceInfo: _onGetDeviceInfoAction,
    },
  );
}

InspectionTaskState _onAction(
  InspectionTaskState state,
  Action action,
) {
  final InspectionTaskState newState = state.clone();
  return newState;
}

InspectionTaskState _onGetDeviceInfoAction(
  InspectionTaskState state,
  Action action,
) {
  InspectionTaskState newState = state.clone();
  newState.map = action.payload;
  return newState;
}

InspectionTaskState _onGetInspectionTasks(
  InspectionTaskState state,
  Action action,
) {
  InspectionTaskState newState = state.clone();
  newState.model = action.payload;
  return newState;
}
