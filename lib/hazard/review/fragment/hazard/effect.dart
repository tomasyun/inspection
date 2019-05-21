import 'package:fish_redux/fish_redux.dart';
import 'package:inspection/global/dico_http.dart';

import 'action.dart';
import 'state.dart';

Effect<HazardInfoFragState> buildEffect() {
  return combineEffects(<Object, Effect<HazardInfoFragState>>{
    HazardInfoFragAction.action: _onAction,
    Lifecycle.initState: _onInit,
  });
}

void _onAction(Action action, Context<HazardInfoFragState> ctx) {}

void _onInit(Action action, Context<HazardInfoFragState> ctx) {
  DicoHttpRepository.doGetHazardInfoRequest(ctx.state.id).then((model) {
    if (model.code == 0) {
      ctx.dispatch(HazardInfoFragActionCreator.onGetHazardModelAction(model));
    }
  });
}
