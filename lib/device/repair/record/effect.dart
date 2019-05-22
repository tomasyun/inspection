import 'package:fish_redux/fish_redux.dart';
import 'package:inspection/device/repair/record/action.dart';
import 'package:inspection/device/repair/record/state.dart';
import 'package:inspection/global/app_common.dart';
import 'package:inspection/global/dico_http.dart';

Effect<RecordState> buildEffect() {
  return combineEffects(<Object, Effect<RecordState>>{
    Lifecycle.initState: _onAction,
  });
}

_onAction(Action action, Context<RecordState> ctx) {
  DicoHttpRepository.doGetRepairRecordRequest(
          '40288a8a6aba494a016ac398a0240002')
      .then((model) {
    if (model.code == 0) {
      ctx.dispatch(RecordActionCreator.initListData(model));
    } else {
      AppCommons.showToast(model.msg);
    }
  });
}
