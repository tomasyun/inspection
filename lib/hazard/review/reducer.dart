import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<ReviewState> buildReducer() {
  return asReducer(
    <Object, Reducer<ReviewState>>{
      ReviewAction.action: _onAction,
    },
  );
}

ReviewState _onAction(
  ReviewState state,
  Action action,
) {
  final ReviewState newState = state.clone();
  return newState;
}
