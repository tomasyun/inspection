import 'package:fish_redux/fish_redux.dart';
import 'package:inspection/entity/notice_model.dart';
import 'package:inspection/global/app_common.dart';

import 'action.dart';

Effect<Data> buildEffect() {
  return combineEffects(<Object, Effect<Data>>{
    NoticeItemAction.action: _onAction,
    NoticeItemAction.delete: _onDelete,
  });
}

void _onAction(Action action, Context<Data> ctx) {}

void _onDelete(Action action, Context<Data> ctx) {
  AppCommons.showToast('暂未实现');
}
