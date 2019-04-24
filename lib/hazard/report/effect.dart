import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Effect<HazardReportState> buildEffect() {
  return combineEffects(<Object, Effect<HazardReportState>>{
    HazardReportAction.action: _onAction,
  });
}

void _onAction(Action action, Context<HazardReportState> ctx) {}
