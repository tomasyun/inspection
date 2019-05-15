import 'package:fish_redux/fish_redux.dart';
import 'package:inspection/entity/plan_model.dart';

import 'action.dart';
import 'state.dart';

Effect<MinePlanState> buildEffect() {
  return combineEffects(<Object, Effect<MinePlanState>>{
    MinePlanAction.action: _onAction,
    Lifecycle.initState: _onGetMinePlans,
  });
}

void _onAction(Action action, Context<MinePlanState> ctx) {}
void _onGetMinePlans(Action action, Context<MinePlanState> ctx) {
  List<PlanModel> list = [
    PlanModel(
        planName: '整个办公区消防设施保养检查',
        planNo: '007',
        depart: '陕西缔科网络科技有限公司',
        checkState: '待审批',
        planState: '待执行')
  ];
  ctx.dispatch(MinePlanActionCreator.onGetMinePlans(list));
}
