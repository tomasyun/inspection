import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Effect<ReportRecordState> buildEffect() {
  return combineEffects(<Object, Effect<ReportRecordState>>{
    ReportRecordAction.action: _onAction,
  });
}

void _onAction(Action action, Context<ReportRecordState> ctx) {}
