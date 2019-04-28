import 'package:fish_redux/fish_redux.dart';
import 'package:inspection/entity/warning_model.dart';

import 'action.dart';

Effect<WarningModel> buildEffect() {
  return combineEffects(<Object, Effect<WarningModel>>{
    WarningItemAction.action: _onAction,
  });
}

void _onAction(Action action, Context<WarningModel> ctx) {}
