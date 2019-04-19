import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<ReportState> buildReducer() {
  return asReducer(
    <Object, Reducer<ReportState>>{
      ReportAction.action: _onAction,
    },
  );
}

ReportState _onAction(ReportState state, Action action) {
  final ReportState newState = state.clone();
  return newState;
}
