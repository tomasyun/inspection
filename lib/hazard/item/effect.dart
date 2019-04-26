import 'package:fish_redux/fish_redux.dart';
import 'package:inspection/entity/hazard_model.dart';

import 'action.dart';

Effect<HazardModel> buildEffect() {
  return combineEffects(<Object, Effect<HazardModel>>{
    HazardItemAction.action: _onAction,
  });
}

void _onAction(Action action, Context<HazardModel> ctx) {}
