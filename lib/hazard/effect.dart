import 'package:fish_redux/fish_redux.dart';
import 'package:inspection/entity/hazard_model.dart';

import 'action.dart';
import 'state.dart';

Effect<HazardState> buildEffect() {
  return combineEffects(<Object, Effect<HazardState>>{
    Lifecycle.initState: _initHazardListData,
    HazardAction.action: _onAction,
  });
}

void _onAction(Action action, Context<HazardState> ctx) {}

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
