import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Effect<ReportState> buildEffect() {
  return combineEffects(<Object, Effect<ReportState>>{
    ReportAction.action: _onAction,
  });
}

void _onAction(Action action, Context<ReportState> ctx) {}
