import 'package:fish_redux/fish_redux.dart';
import 'package:inspection/entity/notice_model.dart';

import 'action.dart';

Effect<NoticeModel> buildEffect() {
  return combineEffects(<Object, Effect<NoticeModel>>{
    NoticeItemAction.action: _onAction,
  });
}

void _onAction(Action action, Context<NoticeModel> ctx) {}
