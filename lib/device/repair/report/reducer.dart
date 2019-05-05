import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<ReportState> buildReducer() {
  return asReducer(
    <Object, Reducer<ReportState>>{
      ReportAction.action: _onAction,
      ReportAction.departRst: _onGetDepartRst,
      ReportAction.applicantRst: _onGetApplicantRst
    },
  );
}

ReportState _onAction(ReportState state, Action action) {
  ReportState newState = state.clone();
  return newState;
}

ReportState _onGetDepartRst(ReportState state, Action action) {
  ReportState newState = state.clone();
  newState.departRst = action.payload;
  return newState;
}

ReportState _onGetApplicantRst(ReportState state, Action action) {
  ReportState newState = state.clone();
  newState.applicantRst = action.payload;
  return newState;
}
