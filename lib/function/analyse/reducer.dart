import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<SaveAnalyseState> buildReducer() {
  return asReducer(
    <Object, Reducer<SaveAnalyseState>>{
      SaveAnalyseAction.action: _onAction,
    },
  );
}

SaveAnalyseState _onAction(SaveAnalyseState state, Action action) {
  final SaveAnalyseState newState = state.clone();
  return newState;
}
