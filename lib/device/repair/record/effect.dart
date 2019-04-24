import 'package:fish_redux/fish_redux.dart';
import 'package:inspection/device/repair/record/action.dart';
import 'package:inspection/device/repair/record/state.dart';
import 'package:inspection/entity/repair_record.dart';

Effect<RecordState> buildEffect() {
  return combineEffects(<Object, Effect<RecordState>>{
    Lifecycle.initState: _onAction,
  });
}

_onAction(Action action, Context<RecordState> ctx) {
  List<RepairRecord> list = [
    RepairRecord(
        state: "待维修",
        desc: "螺丝松动",
        name: "消防栓",
        date: "2019-04-24",
        depart: "缔科研发",
        applicant: '高大陆'),
    RepairRecord(
        state: "已维修",
        desc: "水枪头损坏",
        name: "高压水枪",
        date: "2019-02-28",
        depart: "通昱消防",
        applicant: '黄骁')
  ];
  ctx.dispatch(RecordActionCreator.initListData(list));
}
