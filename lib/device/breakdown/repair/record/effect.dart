import 'package:fish_redux/fish_redux.dart';
import 'package:inspection/device/breakdown/repair/record/action.dart';
import 'package:inspection/entity/repair_record.dart';

import 'state.dart';

Effect<RecordState> buildEffect() {
  return combineEffects(<Object, Effect<RecordState>>{
    Lifecycle.initState: _onAction,
  });
}

_onAction(Action action, Context<RecordState> ctx) {
  List<RepairRecItem> datalist = [
    RepairRecItem(
        state: "待维修",
        desc: "#########",
        name: "消防栓",
        date: "2019-04-24",
        depart: "缔科研发",
        applyer: '高大陆'),
    RepairRecItem(
        state: "已维修",
        desc: "水枪头损坏",
        name: "高压水枪###########",
        date: "2019-02-28",
        depart: "通昱消防",
        applyer: '黄骁')
  ];
  ctx.dispatch(RecordActionCreator.initListData(datalist));
}
