import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_picker/Picker.dart';
import 'package:inspection/entity/hazard_model.dart';

import 'action.dart';
import 'state.dart';

Effect<HazardState> buildEffect() {
  return combineEffects(<Object, Effect<HazardState>>{
    Lifecycle.initState: _initHazardListData,
    HazardAction.action: _onAction,
    HazardAction.selectDate: _onSelectDate,
  });
}

void _onAction(Action action, Context<HazardState> ctx) {}

void _onSelectDate(Action action, Context<HazardState> ctx) {
  new Picker(
          adapter: new DateTimePickerAdapter(
              type: PickerDateTimeType.kYMD,
              isNumberMonth: true,
              yearSuffix: "年",
              monthSuffix: "月",
              daySuffix: "日"),
          onConfirm: (Picker picker, List value) {
            print(picker.adapter.text);
          },
          cancelText: '取消',
          confirmText: '确定',
          hideHeader: true,
          confirmTextStyle: TextStyle(fontSize: 14.0),
          cancelTextStyle: TextStyle(fontSize: 14.0),
          onSelect: (Picker picker, int index, List<int> selecteds) {})
      .showDialog(ctx.context);
}

void _onSearchEndDate(Action action, Context<HazardState> ctx) {}

void _initHazardListData(Action action, Context<HazardState> ctx) {
  List<HazardModel> list = [
    HazardModel(
        desc: '焊接车间,地面留油',
        depart: '缔科研发部',
        data: '2019-05-02',
        state: '待整改',
        rectifier: '贠拓'),
    HazardModel(
        desc: '焊接车间,地面留油',
        depart: '通昱行政部',
        data: '2019-05-02',
        state: '待复查',
        rectifier: '高大陆'),
    HazardModel(
        desc: '挡风玻璃有裂痕',
        depart: '通昱行政部',
        data: '2019-05-02',
        state: '待审批',
        rectifier: '黄骁'),
    HazardModel(
        desc: '焊接车间,地面留油',
        depart: '通昱行政部',
        data: '2019-05-02',
        state: '已完成',
        rectifier: '王婷'),
  ];
  ctx.dispatch(HazardActionCreator.onInitHazardListData(list));
}
