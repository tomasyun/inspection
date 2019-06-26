import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<RectifyReportState> buildReducer() {
  return asReducer(
    <Object, Reducer<RectifyReportState>>{
      RectifyReportAction.action: _onAction,
      RectifyReportAction.images: _onPickImages,
      RectifyReportAction.form: _onGetRectifyForm,
    },
  );
}

RectifyReportState _onAction(
  RectifyReportState state,
  Action action,
) {
  final RectifyReportState newState = state.clone();
  return newState;
}

RectifyReportState _onGetRectifyForm(
  RectifyReportState state,
  Action action,
) {
  RectifyReportState newState = state.clone();
  newState.map = action.payload;
  return newState;
}

RectifyReportState _onPickImages(
  RectifyReportState state,
  Action action,
) {
  RectifyReportState newState = state.clone();
  newState.assets = action.payload;
  return newState;
}
