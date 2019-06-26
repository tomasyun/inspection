import 'package:fish_redux/fish_redux.dart';
import 'package:inspection/global/dico_http.dart';

import 'action.dart';
import 'state.dart';

Effect<NoticeState> buildEffect() {
  return combineEffects(<Object, Effect<NoticeState>>{
    NoticeAction.action: _onAction,
    Lifecycle.initState: _onGetNotices,
  });
}

void _onAction(
  Action action,
  Context<NoticeState> ctx,
) {}

void _onGetNotices(
  Action action,
  Context<NoticeState> ctx,
) {
  DicoHttpRepository.doGetNotice().then((model) {
    ctx.dispatch(NoticeActionCreator.onGetNotices(model));
  });
//  ctx.dispatch(NoticeActionCreator.onGetNotices(list));
}
