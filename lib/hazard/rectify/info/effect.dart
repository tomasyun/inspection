import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Effect<RectifyInfoState> buildEffect() {
  return combineEffects(<Object, Effect<RectifyInfoState>>{
    RectifyInfoAction.action: _onAction,
    Lifecycle.initState: _init,
  });
}

void _onAction(Action action, Context<RectifyInfoState> ctx) {}
void _init(Action action, Context<RectifyInfoState> ctx) {
//  DicoHttpRepository.doGetRecheckInfoRequest(hazardId);
}
