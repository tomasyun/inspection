import 'package:fish_redux/fish_redux.dart';
import 'package:inspection/global/dico_http.dart';

import 'action.dart';
import 'state.dart';

Effect<RecheckInfoFragState> buildEffect() {
  return combineEffects(<Object, Effect<RecheckInfoFragState>>{
    RecheckInfoFragAction.action: _onAction,
    Lifecycle.initState: _onInit,
  });
}

void _onAction(Action action, Context<RecheckInfoFragState> ctx) {}

void _onInit(Action action, Context<RecheckInfoFragState> ctx) {
  DicoHttpRepository.doGetRecheckInfoRequest(ctx.state.id).then((model) {
    if (model.code == 0) {
      ctx.dispatch(RecheckInfoFragActionCreator.onGetRecheckInfoModel(model));
    }
  });
}
