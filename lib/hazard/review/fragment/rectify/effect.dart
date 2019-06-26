import 'package:fish_redux/fish_redux.dart';
import 'package:inspection/global/app_common.dart';
import 'package:inspection/global/dico_http.dart';

import 'action.dart';
import 'state.dart';

Effect<RectifyInfoFragState> buildEffect() {
  return combineEffects(<Object, Effect<RectifyInfoFragState>>{
    RectifyInfoFragAction.action: _onAction,
    Lifecycle.initState: _onInit,
  });
}

void _onAction(
  Action action,
  Context<RectifyInfoFragState> ctx,
) {}

void _onInit(
  Action action,
  Context<RectifyInfoFragState> ctx,
) {
  DicoHttpRepository.doGetRectifyInfoRequest(ctx.state.id).then((model) {
    if (model.code == 0) {
      ctx.dispatch(RectifyInfoFragActionCreator.onGetRectifyInfoModel(model));
    } else {
      AppCommons.showToast(model.msg);
    }
  });
}
