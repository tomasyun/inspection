import 'package:fish_redux/fish_redux.dart';
import 'package:inspection/entity/plan_about_model.dart';

import 'action.dart';
import 'state.dart';

Effect<PlanAboutState> buildEffect() {
  return combineEffects(<Object, Effect<PlanAboutState>>{
    PlanAboutAction.action: _onAction,
    Lifecycle.initState: _onGetPlanAbouts,
  });
}

void _onAction(Action action, Context<PlanAboutState> ctx) {}

void _onGetPlanAbouts(Action action, Context<PlanAboutState> ctx) {
  List<PlanAboutModel> list = [
    PlanAboutModel(
        deviceName: '火灾报警控制器',
        deviceNo: '007',
        location: '陕西省西安市高新区丈八一路汇鑫IBC',
        deviceType: '灭火器',
        taskState: '带巡检')
  ];
  ctx.dispatch(PlanAboutActionCreator.onGetPlanAbouts(list));
}
