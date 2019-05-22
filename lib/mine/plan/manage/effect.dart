import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_picker/Picker.dart';
import 'package:inspection/global/app_common.dart';
import 'package:inspection/global/dico_http.dart';
import 'package:inspection/mine/plan/manage/action.dart';
import 'package:inspection/mine/plan/manage/state.dart';

Effect<InspectPlanState> buildEffect() {
  return combineEffects(<Object, Effect<InspectPlanState>>{
    InspectPlanAction.action: _onAction,
    Lifecycle.initState: _onGetInspectPlans,
    InspectPlanAction.search: _onSearchAction,
    InspectPlanAction.reset: _onResetAction,
    InspectPlanAction.selectState: _onSelectPlanState,
  });
}

void _onAction(Action action, Context<InspectPlanState> ctx) {}

void _onSelectPlanState(Action action, Context<InspectPlanState> ctx) {
  Map<String, String> map = Map();
  map['未开始'] = '0';
  map['进行中'] = '1';
  map['已完成'] = '2';
  Picker(
      adapter: PickerDataAdapter<String>(pickerdata: map.keys.toList()),
      height: 120,
      hideHeader: true,
      cancelText: '取消',
      confirmText: '确定',
      onConfirm: (Picker picker, List value) {
        ctx.dispatch(InspectPlanActionCreator.onGetPlanStateAction(
            picker.getSelectedValues()[0]));
        ctx.state.map['planStatus'] = map[picker.getSelectedValues()[0]];
      }).showDialog(ctx.context);
}

void _onSearchAction(Action action, Context<InspectPlanState> ctx) {
  if (ctx.state.controller.text.isNotEmpty) {
    ctx.state.map['planName'] = ctx.state.controller.text;
  }
  String research = '';
  StringBuffer buffer = StringBuffer();
  buffer.write('?isSelf=false');
  if (ctx.state.map.isNotEmpty) {
    for (int i = 0; i < ctx.state.map.length; i++) {
      buffer.write(
          '&${ctx.state.map.keys.toList()[i]}=${ctx.state.map.values.toList()[i]}');
    }
  }
  research = buffer.toString();
  DicoHttpRepository.doInspectPlanRequest(research).then((model) {
    if (model.code == 0) {
      ctx.dispatch(InspectPlanActionCreator.onGetInspectPlans(model));
    } else {
      AppCommons.showToast(model.msg);
    }
  });
}

void _onResetAction(Action action, Context<InspectPlanState> ctx) {
  ctx.dispatch(InspectPlanActionCreator.onGetPlanStateAction('请选择'));
  ctx.state.map.clear();
  String research = '?isSelf=false';
  DicoHttpRepository.doInspectPlanRequest(research).then((model) {
    if (model.code == 0) {
      ctx.dispatch(InspectPlanActionCreator.onGetInspectPlans(model));
    } else {
      AppCommons.showToast(model.msg);
    }
  });
}

void _onGetInspectPlans(Action action, Context<InspectPlanState> ctx) {
  String research = '?isSelf=false';
  DicoHttpRepository.doInspectPlanRequest(research).then((model) {
    if (model.code == 0) {
      ctx.dispatch(InspectPlanActionCreator.onGetInspectPlans(model));
    } else {
      AppCommons.showToast(model.msg);
    }
  });
}
