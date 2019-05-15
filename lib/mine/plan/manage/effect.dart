import 'package:fish_redux/fish_redux.dart';
import 'package:inspection/entity/plan_model.dart';
import 'package:inspection/mine/plan/manage/action.dart';
import 'package:inspection/mine/plan/manage/state.dart';

Effect<InspectPlanState> buildEffect() {
  return combineEffects(<Object, Effect<InspectPlanState>>{
    InspectPlanAction.action: _onAction,
    Lifecycle.initState: _onGetInspectPlans,
  });
}

void _onAction(Action action, Context<InspectPlanState> ctx) {}

void _onGetInspectPlans(Action action, Context<InspectPlanState> ctx) {
  List<PlanModel> list = [
    PlanModel(
        planName: '整个办公区消防设施保养检查',
        planNo: '007',
        depart: '陕西缔科网络科技有限公司',
        checkState: '待审批',
        planState: '待执行')
  ];
  ctx.dispatch(InspectPlanActionCreator.onGetInspectPlans(list));
}
