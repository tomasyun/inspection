import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<CostApplyState> buildReducer() {
  return asReducer(
    <Object, Reducer<CostApplyState>>{
      CostApplyAction.action: _onAction,
    },
  );
}

CostApplyState _onAction(
  CostApplyState state,
  Action action,
) {
  final CostApplyState newState = state.clone();
  return newState;
}
