import 'package:fish_redux/fish_redux.dart';
import 'package:inspection/notice/item/action.dart';

import 'action.dart';
import 'state.dart';

Reducer<NoticeState> buildReducer() {
  return asReducer(
    <Object, Reducer<NoticeState>>{
      NoticeAction.action: _onAction,
      NoticeAction.notices: _onGetNotices,
      NoticeItemAction.delete: _onDeleteAction,
    },
  );
}

NoticeState _onAction(NoticeState state, Action action) {
  final NoticeState newState = state.clone();
  return newState;
}

NoticeState _onDeleteAction(NoticeState state, Action action) {
  NoticeState newState = state.clone();
  newState.model = action.payload;
  return newState;
}

NoticeState _onGetNotices(NoticeState state, Action action) {
  NoticeState newState = state.clone();
  newState.model = action.payload;
  return newState;
}
