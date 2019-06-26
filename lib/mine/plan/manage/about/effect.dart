import 'package:fish_redux/fish_redux.dart';
import 'package:inspection/global/app_common.dart';
import 'package:inspection/global/dico_http.dart';

import 'action.dart';
import 'state.dart';

Effect<PlanAboutState> buildEffect() {
  return combineEffects(<Object, Effect<PlanAboutState>>{
    PlanAboutAction.action: _onAction,
    Lifecycle.initState: _onGetPlanAbouts,
  });
}

void _onAction(
  Action action,
  Context<PlanAboutState> ctx,
) {}

void _onGetPlanAbouts(
  Action action,
  Context<PlanAboutState> ctx,
) {
  DicoHttpRepository.doAboutPlanRequest(ctx.state.id).then((model) {
    if (model.code == 0) {
      ctx.dispatch(PlanAboutActionCreator.onGetPlanAbouts(model));
    } else {
      AppCommons.showToast(model.msg);
    }
  });
}
