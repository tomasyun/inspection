import 'package:fish_redux/fish_redux.dart';
import 'package:inspection/entity/plan_about_model.dart';

import 'action.dart';

Effect<Data> buildEffect() {
  return combineEffects(<Object, Effect<Data>>{
    PlanAboutItemAction.action: _onAction,
    PlanAboutItemAction.scanQRCode: _onScanQRCode,
  });
}

void _onAction(Action action, Context<Data> ctx) {}

void _onScanQRCode(Action action, Context<Data> ctx) {}
