import 'package:fish_redux/fish_redux.dart';
import 'action.dart';
import 'state.dart';

Effect<RecheckReportState> buildEffect() {
  return combineEffects(<Object, Effect<RecheckReportState>>{
    RecheckReportAction.action: _onAction,
  });
}

void _onAction(Action action, Context<RecheckReportState> ctx) {
}
