import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<RecheckReportState> buildReducer() {
  return asReducer(
    <Object, Reducer<RecheckReportState>>{
      RecheckReportAction.action: _onAction,
      RecheckReportAction.images: _onPickImages,
    },
  );
}

RecheckReportState _onAction(RecheckReportState state, Action action) {
  RecheckReportState newState = state.clone();
  return newState;
}

RecheckReportState _onPickImages(RecheckReportState state, Action action) {
  RecheckReportState newState = state.clone();
  newState.assets = action.payload;
  return newState;
}
