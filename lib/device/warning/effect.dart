import 'package:fish_redux/fish_redux.dart';
import 'package:inspection/entity/warning_model.dart';
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
  List<WarningModel> list = [
    WarningModel(
        level: '紧急',
        deviceName: '设备1',
        reason: '到达使用年限',
        depart: '陕西缔科网络科技有限公司',
        pic: '王婷'),
    WarningModel(
        level: '一般',
        deviceName: '设备2',
        reason: '到达使用年限',
        depart: '陕西缔科网络科技有限公司',
        pic: '王婷')
  ];
  ctx.dispatch(WarningActionCreator.initState(list));

  DicoHttpRepository.doGetDeviceWarningRequest();
}
