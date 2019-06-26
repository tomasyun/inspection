import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<ReportRecordState> buildReducer() {
  return asReducer(
    <Object, Reducer<ReportRecordState>>{
      ReportRecordAction.action: _onAction,
    },
  );
}

ReportRecordState _onAction(
  ReportRecordState state,
  Action action,
) {
  final ReportRecordState newState = state.clone();
  return newState;
}
