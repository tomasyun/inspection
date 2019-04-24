import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<HazardReportState> buildReducer() {
  return asReducer(
    <Object, Reducer<HazardReportState>>{
      HazardReportAction.action: _onAction,
    },
  );
}

HazardReportState _onAction(HazardReportState state, Action action) {
  final HazardReportState newState = state.clone();
  return newState;
}
