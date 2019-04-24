import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<RectifyReportState> buildReducer() {
  return asReducer(
    <Object, Reducer<RectifyReportState>>{
      RectifyReportAction.action: _onAction,
    },
  );
}

RectifyReportState _onAction(RectifyReportState state, Action action) {
  final RectifyReportState newState = state.clone();
  return newState;
}
