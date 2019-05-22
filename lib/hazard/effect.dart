import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_picker/Picker.dart';
import 'package:inspection/global/app_common.dart';
import 'package:inspection/global/dico_http.dart';

import 'action.dart';
import 'state.dart';

Effect<HazardState> buildEffect() {
  return combineEffects(<Object, Effect<HazardState>>{
    Lifecycle.initState: _initHazardListData,
    HazardAction.action: _onAction,
    HazardAction.selectStartDate: _onSelectStartDate,
    HazardAction.selectEndDate: _onSelectEndDate,
    HazardAction.selectState: _onSelectState,
    HazardAction.research: _onResearch,
    HazardAction.reset: _onReset,
  });
}

void _onAction(Action action, Context<HazardState> ctx) {}

void _onResearch(Action action, Context<HazardState> ctx) {
  String research = '';
  StringBuffer buffer = StringBuffer();
  if (ctx.state.map.isNotEmpty) {
    buffer.write('?');
    if (ctx.state.map.length == 1) {
      buffer.write(
          '${ctx.state.map.keys.toList()[0]}=${ctx.state.map.values.toList()[0]}');
      research = buffer.toString();
    } else {
      for (int i = 0; i < ctx.state.map.length; i++) {
        buffer.write(
            '${ctx.state.map.keys.toList()[i]}=${ctx.state.map.values.toList()[i]}&');
        research = buffer.toString().substring(0, buffer.length - 1);
      }
    }
  }
  DicoHttpRepository.doGetHazardManageRequest(research).then((model) {
    ctx.dispatch(HazardActionCreator.onInitHazardListData(model));
  });
}

void _onReset(Action action, Context<HazardState> ctx) {
  ctx.dispatch(HazardActionCreator.getStartDate('请选择'));
  ctx.dispatch(HazardActionCreator.getEndDate('请选择'));
  ctx.dispatch(HazardActionCreator.getHazardState('请选择'));
  ctx.state.map.clear();
  DicoHttpRepository.doGetHazardManageRequest('').then((model) {
    ctx.dispatch(HazardActionCreator.onInitHazardListData(model));
  });
}

void _onSelectState(Action action, Context<HazardState> ctx) {
  Map<String, String> map = Map();
  map['待整改'] = '1';
  map['待审批'] = '0';
  map['待复查'] = '2';
  Picker(
      adapter: PickerDataAdapter<String>(pickerdata: map.keys.toList()),
      height: 120,
      hideHeader: true,
      cancelText: '取消',
      confirmText: '确定',
      onConfirm: (Picker picker, List value) {
        ctx.dispatch(
            HazardActionCreator.getHazardState(picker.getSelectedValues()[0]));
        ctx.state.map['dangerStatus'] = map[picker.getSelectedValues()[0]];
      }).showDialog(ctx.context);
}

void _onSelectStartDate(Action action, Context<HazardState> ctx) {
  new Picker(
    adapter: new DateTimePickerAdapter(
        type: PickerDateTimeType.kYMD,
        isNumberMonth: true,
        yearSuffix: '年',
        monthSuffix: '月',
        daySuffix: '日'),
    onConfirm: (Picker picker, List value) {
      ctx.dispatch(HazardActionCreator.getStartDate(
          picker.adapter.text.substring(0, 10)));
      ctx.state.map['beginDate'] = picker.adapter.text.substring(0, 10);
    },
    cancelText: '取消',
    confirmText: '确定',
    hideHeader: true,
  ).showDialog(ctx.context);
}

void _onSelectEndDate(Action action, Context<HazardState> ctx) {
  new Picker(
    adapter: new DateTimePickerAdapter(
        type: PickerDateTimeType.kYMD,
        isNumberMonth: true,
        yearSuffix: '年',
        monthSuffix: '月',
        daySuffix: '日'),
    onConfirm: (Picker picker, List value) {
      ctx.dispatch(
          HazardActionCreator.getEndDate(picker.adapter.text.substring(0, 10)));
      ctx.state.map['endDate'] = picker.adapter.text.substring(0, 10);
    },
    cancelText: '取消',
    confirmText: '确定',
    hideHeader: true,
  ).showDialog(ctx.context);
}

void _initHazardListData(Action action, Context<HazardState> ctx) {
  ctx.dispatch(HazardActionCreator.onGetContext(ctx.context));
  DicoHttpRepository.doGetHazardManageRequest('').then((model) {
    if (model.code == 0) {
      ctx.dispatch(HazardActionCreator.onInitHazardListData(model));
    } else {
      AppCommons.showToast(model.msg);
    }
  });
}
