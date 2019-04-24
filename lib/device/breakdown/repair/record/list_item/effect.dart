import 'package:fish_redux/fish_redux.dart';
import 'package:inspection/entity/repair_record.dart';

import 'action.dart';

Effect<RepairRecItem> buildEffect() {
  return combineEffects(<Object, Effect<RepairRecItem>>{
    RecordAction.action: _onAction,
  });
}

void _onAction(Action action, Context<RepairRecItem> ctx) {}
