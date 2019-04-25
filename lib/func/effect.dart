import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Effect<FunctionState> buildEffect() {
  return combineEffects(<Object, Effect<FunctionState>>{
    FunctionAction.action: _onAction,
    FunctionAction.scanQRCode: _onDeviceScanQRCode,
    FunctionAction.warning: _onDeviceWarning,
    FunctionAction.brokenReport: _onBrokenReport,
    FunctionAction.hazardReport: _onHazardReport,
    FunctionAction.hazardReview: _onHazardReview,
    FunctionAction.inspectionPlan: _onInspectionPlan,
    FunctionAction.task: _onMineTask
  });
}

void _onAction(Action action, Context<FunctionState> ctx) {}
void _onDeviceScanQRCode(Action action, Context<FunctionState> ctx) {}
void _onDeviceWarning(Action action, Context<FunctionState> ctx) {}
void _onBrokenReport(Action action, Context<FunctionState> ctx) {}
void _onHazardReport(Action action, Context<FunctionState> ctx) {}
void _onHazardReview(Action action, Context<FunctionState> ctx) {}
void _onInspectionPlan(Action action, Context<FunctionState> ctx) {}
void _onMineTask(Action action, Context<FunctionState> ctx) {}
