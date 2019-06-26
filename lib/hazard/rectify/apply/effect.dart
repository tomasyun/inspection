import 'package:fish_redux/fish_redux.dart';
import 'package:inspection/global/app_common.dart';

import 'action.dart';
import 'state.dart';

Effect<CostApplyState> buildEffect() {
  return combineEffects(<Object, Effect<CostApplyState>>{
    CostApplyAction.action: _onAction,
    CostApplyAction.report: _onReport,
  });
}

void _onAction(
  Action action,
  Context<CostApplyState> ctx,
) {}

void _onReport(
  Action action,
  Context<CostApplyState> ctx,
) {
//  AppToast.showToast('暂未实现');
  if (ctx.state.costController.text.isEmpty) {
    AppCommons.showToast('请输入整改金额');
  } else if (ctx.state.decsController.text.isEmpty) {
    AppCommons.showToast('请输入费用申请缘由');
  } else {
    AppCommons.showToast('暂未实现');
  }
}
