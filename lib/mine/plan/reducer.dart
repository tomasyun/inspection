import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<InspectPlanState> buildReducer() {
  return asReducer(
    <Object, Reducer<InspectPlanState>>{
      InspectPlanAction.action: _onAction,
    },
  );
}

InspectPlanState _onAction(InspectPlanState state, Action action) {
  final InspectPlanState newState = state.clone();
  return newState;
}
