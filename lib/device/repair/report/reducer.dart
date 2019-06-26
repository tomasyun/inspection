import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<ReportState> buildReducer() {
  return asReducer(
    <Object, Reducer<ReportState>>{
      ReportAction.action: _onAction,
      ReportAction.departRst: _onGetDepartRst,
      ReportAction.picRst: _onGetPicRst,
      ReportAction.repairmanRst: _onGetRepairManRst,
      ReportAction.repairDateRst: _onGetRepairDateRst,
      ReportAction.deviceInfo: _onGetDeviceInfoAction,
    },
  );
}

ReportState _onAction(
  ReportState state,
  Action action,
) {
  ReportState newState = state.clone();
  return newState;
}

ReportState _onGetDeviceInfoAction(
  ReportState state,
  Action action,
) {
  ReportState newState = state.clone();
  newState.deviceInfo = action.payload;
  return newState;
}

ReportState _onGetRepairDateRst(
  ReportState state,
  Action action,
) {
  ReportState newState = state.clone();
  newState.repairDateRst = action.payload;
  return newState;
}

ReportState _onGetDepartRst(
  ReportState state,
  Action action,
) {
  ReportState newState = state.clone();
  newState.departRst = action.payload;
  return newState;
}

ReportState _onGetPicRst(
  ReportState state,
  Action action,
) {
  ReportState newState = state.clone();
  newState.picRst = action.payload;
  return newState;
}

ReportState _onGetRepairManRst(
  ReportState state,
  Action action,
) {
  ReportState newState = state.clone();
  newState.repairManRst = action.payload;
  return newState;
}
