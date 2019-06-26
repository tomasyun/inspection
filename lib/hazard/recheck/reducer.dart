import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<RecheckReportState> buildReducer() {
  return asReducer(
    <Object, Reducer<RecheckReportState>>{
      RecheckReportAction.action: _onAction,
      RecheckReportAction.images: _onPickImages,
      RecheckReportAction.formId: _onGetRecheckFormId,
    },
  );
}

RecheckReportState _onAction(
  RecheckReportState state,
  Action action,
) {
  RecheckReportState newState = state.clone();
  return newState;
}

RecheckReportState _onGetRecheckFormId(
    RecheckReportState state, Action action) {
  RecheckReportState newState = state.clone();
  newState.recheckFormId = action.payload;
  return newState;
}

RecheckReportState _onPickImages(
  RecheckReportState state,
  Action action,
) {
  RecheckReportState newState = state.clone();
  newState.assets = action.payload;
  return newState;
}
