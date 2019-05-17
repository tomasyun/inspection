import 'package:fish_redux/fish_redux.dart';
import 'package:inspection/entity/hazard_model.dart';

import 'action.dart';

Effect<Data> buildEffect() {
  return combineEffects(<Object, Effect<Data>>{
    HistoryItemAction.action: _onAction,
  });
}

void _onAction(Action action, Context<Data> ctx) {}
