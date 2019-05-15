import 'package:fish_redux/fish_redux.dart';
import 'package:inspection/mine/plan/manage/action.dart';
import 'package:inspection/mine/plan/manage/state.dart';

Reducer<InspectPlanState> buildReducer() {
  return asReducer(
    <Object, Reducer<InspectPlanState>>{
      InspectPlanAction.action: _onAction,
      InspectPlanAction.plans: _onGetInspectPlans,
    },
  );
}

InspectPlanState _onAction(InspectPlanState state, Action action) {
  final InspectPlanState newState = state.clone();
  return newState;
}

InspectPlanState _onGetInspectPlans(InspectPlanState state, Action action) {
  InspectPlanState newState = state.clone();
  newState.list = action.payload;
  return newState;
}
