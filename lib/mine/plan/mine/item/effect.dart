import 'package:fish_redux/fish_redux.dart';
import 'package:inspection/entity/plan_model.dart';

import 'action.dart';

Effect<Data> buildEffect() {
  return combineEffects(<Object, Effect<Data>>{
    MinePlanItemAction.action: _onAction,
  });
}

void _onAction(Action action, Context<Data> ctx) {}
