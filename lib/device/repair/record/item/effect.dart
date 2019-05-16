import 'package:fish_redux/fish_redux.dart';
import 'package:inspection/entity/repair_record.dart';
import 'package:inspection/global/app_common.dart';

import 'action.dart';

Effect<RepairRecord> buildEffect() {
  return combineEffects(<Object, Effect<RepairRecord>>{
    RecordItemAction.action: _onAction,
  });
}

void _onAction(Action action, Context<RepairRecord> ctx) {
  AppCommons.showToast("陕西缔科网络科技有限公司");
}
