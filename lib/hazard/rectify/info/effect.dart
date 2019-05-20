import 'package:fish_redux/fish_redux.dart';
import 'package:inspection/global/dico_http.dart';

import 'action.dart';
import 'state.dart';

Effect<RectifyInfoState> buildEffect() {
  return combineEffects(<Object, Effect<RectifyInfoState>>{
    RectifyInfoAction.action: _onAction,
    Lifecycle.initState: _init,
  });
}

void _onAction(Action action, Context<RectifyInfoState> ctx) {}

void _init(Action action, Context<RectifyInfoState> ctx) {
  DicoHttpRepository.doGetRectifyInfoRequest(ctx.state.id).then((model) {
    if (model.code == 0) {
      ctx.dispatch(RectifyInfoActionCreator.onGetRectifyInfoAction(model));
    }
  });
}
