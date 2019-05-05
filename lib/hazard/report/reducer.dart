import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<HazardReportState> buildReducer() {
  return asReducer(
    <Object, Reducer<HazardReportState>>{
      HazardReportAction.action: _onAction,
      HazardReportAction.levelRst: _onGetLevelRst,
      HazardReportAction.typeRst: _onGetTypeRst
    },
  );
}

HazardReportState _onAction(HazardReportState state, Action action) {
  final HazardReportState newState = state.clone();
  return newState;
}

HazardReportState _onGetLevelRst(HazardReportState state, Action action) {
  final HazardReportState newState = state.clone();
  newState.levelRst = action.payload;
  return newState;
}

HazardReportState _onGetTypeRst(HazardReportState state, Action action) {
  final HazardReportState newState = state.clone();
  newState.typeRst = action.payload;
  return newState;
}
