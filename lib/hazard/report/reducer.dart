import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<HazardReportState> buildReducer() {
  return asReducer(
    <Object, Reducer<HazardReportState>>{
      HazardReportAction.action: _onAction,
      HazardReportAction.levelRst: _onGetLevelRst,
      HazardReportAction.typeRst: _onGetTypeRst,
      HazardReportAction.images: _onPickImages,
      HazardReportAction.deviceInfo: _onGetDeviceName,
    },
  );
}

HazardReportState _onAction(HazardReportState state, Action action) {
  HazardReportState newState = state.clone();
  return newState;
}

HazardReportState _onGetDeviceName(HazardReportState state, Action action) {
  HazardReportState newState = state.clone();
  newState.map = action.payload;
  return newState;
}

HazardReportState _onPickImages(HazardReportState state, Action action) {
  HazardReportState newState = state.clone();
  newState.assets = action.payload;
  return newState;
}

HazardReportState _onGetLevelRst(HazardReportState state, Action action) {
  HazardReportState newState = state.clone();
  newState.levelRst = action.payload;
  return newState;
}

HazardReportState _onGetTypeRst(HazardReportState state, Action action) {
  HazardReportState newState = state.clone();
  newState.typeRst = action.payload;
  return newState;
}
