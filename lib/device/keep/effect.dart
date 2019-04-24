import 'package:fish_redux/fish_redux.dart';
import 'package:inspection/device/keep/action.dart';
import 'package:inspection/entity/keep_record.dart';

import 'state.dart';

Effect<KeepState> buildEffect() {
  return combineEffects(<Object, Effect<KeepState>>{
    Lifecycle.initState: _onAction,
  });
}

void _onAction(Action action, Context<KeepState> ctx) {
  List<KeepRecord> list = [
    KeepRecord(state: '已完成', remark: '深度保养', keeper: '贠拓', date: '2019-06-23'),
    KeepRecord(
        state: '未开始', remark: '添加高纯度润滑剂', keeper: '王婷', date: '2019-04-28')
  ];

  ctx.dispatch(KeepActionCreator.onAction(list));
}
