import 'package:fish_redux/fish_redux.dart';
import 'package:inspection/global/app_common.dart';
import 'package:inspection/global/dico_http.dart';

import 'action.dart';
import 'state.dart';

Effect<WarningState> buildEffect() {
  return combineEffects(<Object, Effect<WarningState>>{
    Lifecycle.initState: _initState,
    WarningAction.action: _onAction,
  });
}

void _onAction(Action action, Context<WarningState> ctx) {}

void _initState(Action action, Context<WarningState> ctx) {
  DicoHttpRepository.doGetDeviceWarningRequest().then((model) {
    if (model.code == 0) {
      ctx.dispatch(WarningActionCreator.initState(model));
    } else {
      AppCommons.showToast(model.msg);
    }
  });
}
