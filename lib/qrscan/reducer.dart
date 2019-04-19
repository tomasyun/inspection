import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<QRScanState> buildReducer() {
  return asReducer(
    <Object, Reducer<QRScanState>>{
      QRScanAction.action: _onAction,
    },
  );
}

QRScanState _onAction(QRScanState state, Action action) {
  String result = action.payload ?? "";
  final QRScanState newState = state.clone();
  newState.result = result;
  return newState;
}
