import 'package:fish_redux/fish_redux.dart';
import 'package:inspection/entity/keep_record.dart';

import 'action.dart';

Effect<KeepRecord> buildEffect() {
  return combineEffects(<Object, Effect<KeepRecord>>{
    RecordItemAction.action: _onAction,
  });
}

void _onAction(Action action, Context<KeepRecord> ctx) {}
