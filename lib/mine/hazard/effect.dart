import 'package:fish_redux/fish_redux.dart';
import 'package:inspection/global/dico_http.dart';

import 'action.dart';
import 'state.dart';

Effect<HazardHistoryState> buildEffect() {
  return combineEffects(<Object, Effect<HazardHistoryState>>{
    HazardHistoryAction.action: _onAction,
    Lifecycle.initState: _initHazardListData,
  });
}

void _onAction(Action action, Context<HazardHistoryState> ctx) {}
void _initHazardListData(Action action, Context<HazardHistoryState> ctx) {
  DicoHttpRepository.doGetHistoryHazardRequest().then((model) {
    ctx.dispatch(HazardHistoryActionCreator.onInitHazardListData(model));
  });
}
