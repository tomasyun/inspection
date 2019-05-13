import 'package:fish_redux/fish_redux.dart';
import 'package:inspection/entity/notice_model.dart';

import 'action.dart';
import 'state.dart';

Effect<NoticeState> buildEffect() {
  return combineEffects(<Object, Effect<NoticeState>>{
    NoticeAction.action: _onAction,
    Lifecycle.initState: _onGetNotices,
  });
}

void _onAction(Action action, Context<NoticeState> ctx) {}

void _onGetNotices(Action action, Context<NoticeState> ctx) {
  List<NoticeModel> list = [
    NoticeModel(
        title: '关于液压系统定期巡检任务改期的通知',
        content: '1.定期巡检\n2.设备预警\n3.实时记录设备维修进度',
        date: '2019-06-08'),
    NoticeModel(
        title: '关于液压系统定期巡检任务改期的通知',
        content: '1.定期巡检\n2.设备预警\n3.实时记录设备维修进度',
        date: '2019-06-08')
  ];
  ctx.dispatch(NoticeActionCreator.onGetNotices(list));
}
