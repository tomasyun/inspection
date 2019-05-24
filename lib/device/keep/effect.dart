import 'package:fish_redux/fish_redux.dart';
import 'package:inspection/device/keep/action.dart';
import 'package:inspection/global/app_common.dart';
import 'package:inspection/global/dico_http.dart';

import 'state.dart';

Effect<KeepState> buildEffect() {
  return combineEffects(<Object, Effect<KeepState>>{
    Lifecycle.initState: _onAction,
  });
}

void _onAction(Action action, Context<KeepState> ctx) {
  DicoHttpRepository.doGetKeepRecordRequest(ctx.state.equipmentId)
      .then((model) {
    if (model.code == 0) {
      ctx.dispatch(KeepActionCreator.onAction(model));
    } else {
      AppCommons.showToast(model.msg);
    }
  });

//
}
