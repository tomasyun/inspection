import 'package:fish_redux/fish_redux.dart';
import 'package:inspection/global/dico_http.dart';

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
  String search = '?isSelf=true';
  DicoHttpRepository.doInspectPlanRequest(search).then((model) {
    ctx.dispatch(MinePlanActionCreator.onGetMinePlans(model));
  });
}
