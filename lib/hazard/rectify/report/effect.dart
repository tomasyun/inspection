import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Effect<RectifyReportState> buildEffect() {
  return combineEffects(<Object, Effect<RectifyReportState>>{
    RectifyReportAction.action: _onAction,
  });
}

void _onAction(Action action, Context<RectifyReportState> ctx) {}
