import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<ReviewInfoFragState> buildReducer() {
  return asReducer(
    <Object, Reducer<ReviewInfoFragState>>{
      ReviewInfoFragAction.action: _onAction,
    },
  );
}

ReviewInfoFragState _onAction(ReviewInfoFragState state, Action action) {
  final ReviewInfoFragState newState = state.clone();
  return newState;
}
