import 'package:fish_redux/fish_redux.dart';
import 'package:inspection/entity/notice_model.dart';
import 'package:inspection/global/toast.dart';

import 'action.dart';

Effect<NoticeModel> buildEffect() {
  return combineEffects(<Object, Effect<NoticeModel>>{
    NoticeItemAction.action: _onAction,
    NoticeItemAction.delete: _onDelete,
  });
}

void _onAction(Action action, Context<NoticeModel> ctx) {}

void _onDelete(Action action, Context<NoticeModel> ctx) {
  AppToast.showToast('暂未实现');
}
