import 'package:fish_redux/fish_redux.dart';
import 'package:inspection/entity/repair_record_model.dart';
import 'package:inspection/global/app_common.dart';

import 'action.dart';

Effect<Data> buildEffect() {
  return combineEffects(<Object, Effect<Data>>{
    RecordItemAction.action: _onAction,
  });
}

void _onAction(
  Action action,
  Context<Data> ctx,
) {
  AppCommons.showToast("陕西缔科网络科技有限公司");
}
