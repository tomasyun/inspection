import 'package:fish_redux/fish_redux.dart';
import 'package:inspection/global/toast.dart';

import 'action.dart';
import 'state.dart';

Effect<UpdatePasswordState> buildEffect() {
  return combineEffects(<Object, Effect<UpdatePasswordState>>{
    UpdatePasswordAction.action: _onAction,
    UpdatePasswordAction.update: _onUpdate,
  });
}

void _onAction(Action action, Context<UpdatePasswordState> ctx) {}
void _onUpdate(Action action, Context<UpdatePasswordState> ctx) {
  AppToast.showToast('暂未实现');
}
