import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_picker/Picker.dart';
import 'package:inspection/entity/hazard_model.dart';
import 'package:inspection/global/app_common.dart';

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
  AppCommons.showToast('开始查询');
}

void _onReset(Action action, Context<HazardState> ctx) {
  ctx.dispatch(HazardActionCreator.getStartDate('请选择'));
  ctx.dispatch(HazardActionCreator.getEndDate('请选择'));
  ctx.dispatch(HazardActionCreator.getHazardState('请选择'));
}

void _onSelectState(Action action, Context<HazardState> ctx) {
  Picker(
      adapter: PickerDataAdapter<String>(pickerdata: ['待整改', '待复查', '待审批']),
//      onCancel: () {
//        Navigator.pop(ctx.context);
//      },
      height: 120,
      hideHeader: true,
      cancelText: '取消',
      confirmText: '确定',
      onConfirm: (Picker picker, List value) {
        ctx.dispatch(
            HazardActionCreator.getHazardState(picker.getSelectedValues()[0]));
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
    },
    cancelText: '取消',
    confirmText: '确定',
    hideHeader: true,
  ).showDialog(ctx.context);
}

void _initHazardListData(Action action, Context<HazardState> ctx) {
  List<HazardModel> list = [
    HazardModel(
        desc: '焊接车间,地面留油',
        depart: '缔科研发部',
        date: '2019-05-02',
        state: '待整改',
        rectifier: '贠拓'),
    HazardModel(
        desc: '焊接车间,地面留油',
        depart: '通昱行政部',
        date: '2019-05-02',
        state: '待复查',
        rectifier: '高大陆'),
    HazardModel(
        desc: '挡风玻璃有裂痕',
        depart: '通昱行政部',
        date: '2019-05-02',
        state: '待审批',
        rectifier: '黄骁'),
    HazardModel(
        desc: '焊接车间,地面留油',
        depart: '通昱行政部',
        date: '2019-05-02',
        state: '已完成',
        rectifier: '王婷'),
  ];
  ctx.dispatch(HazardActionCreator.onInitHazardListData(list));
}
