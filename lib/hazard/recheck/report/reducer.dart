import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<RecheckReportState> buildReducer() {
  return asReducer(
    <Object, Reducer<RecheckReportState>>{
      RecheckReportAction.action: _onAction,
    },
  );
}

RecheckReportState _onAction(RecheckReportState state, Action action) {
  final RecheckReportState newState = state.clone();
  return newState;
}
