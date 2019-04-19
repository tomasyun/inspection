import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<ContentState> buildReducer() {
  return asReducer(
    <Object, Reducer<ContentState>>{
      ContentAction.action: _onAction,
    },
  );
}

ContentState _onAction(ContentState state, Action action) {
  final ContentState newState = state.clone();
  return newState;
}
