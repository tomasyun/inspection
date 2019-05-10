import 'package:fish_redux/fish_redux.dart';
import 'package:inspection/entity/hazard_model.dart';

import 'action.dart';
import 'state.dart';

Effect<HazardHistoryState> buildEffect() {
  return combineEffects(<Object, Effect<HazardHistoryState>>{
    HazardHistoryAction.action: _onAction,
    Lifecycle.initState: _initHazardListData,
  });
}

void _onAction(Action action, Context<HazardHistoryState> ctx) {}
void _initHazardListData(Action action, Context<HazardHistoryState> ctx) {
  List<HazardModel> list = [
    HazardModel(
        desc: '焊接车间,地面留油',
        depart: '通昱行政部',
        date: '2019-05-02',
        state: '已完成',
        rectifier: '高大陆'),
    HazardModel(
        desc: '挡风玻璃有裂痕',
        depart: '通昱行政部',
        date: '2019-05-02',
        state: '已完成',
        rectifier: '黄骁'),
    HazardModel(
        desc: '焊接车间,地面留油',
        depart: '通昱行政部',
        date: '2019-05-02',
        state: '已完成',
        rectifier: '王婷'),
  ];
  ctx.dispatch(HazardHistoryActionCreator.onInitHazardListData(list));
}
