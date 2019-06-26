import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<InfoState> buildReducer() {
  return asReducer(
    <Object, Reducer<InfoState>>{
      InfoAction.action: _onAction,
      InfoAction.model: _onGetEquipmentInfoModels,
    },
  );
}

InfoState _onAction(
  InfoState state,
  Action action,
) {
  final InfoState newState = state.clone();
  return newState;
}

InfoState _onGetEquipmentInfoModels(
  InfoState state,
  Action action,
) {
  InfoState newState = state.clone();
  newState.model = action.payload;
  return newState;
}
