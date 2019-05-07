import 'package:barcode_scan/barcode_scan.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/services.dart';

import 'action.dart';
import 'state.dart';

Effect<InspectionTaskState> buildEffect() {
  return combineEffects(<Object, Effect<InspectionTaskState>>{
    InspectionTaskAction.action: _onAction,
    Lifecycle.initState: _onScanQRCode,
    Lifecycle.didChangeDependencies: _onGetInspectionTask,
  });
}

void _onAction(Action action, Context<InspectionTaskState> ctx) {}

void _onGetInspectionTask(Action action, Context<InspectionTaskState> ctx) {
  List<String> tasks = ['检查设备是否干净', '检查设备预警时间', '检查消防设施是否健全'];
  ctx.dispatch(InspectionTaskActionCreator.onGetInspectionTasks(tasks));
}

void _onScanQRCode(Action action, Context<InspectionTaskState> ctx) async {
  try {
    String qrResult = await BarcodeScanner.scan();
  } on PlatformException catch (ex) {
    if (ex.code == BarcodeScanner.CameraAccessDenied) {
    } else {}
  } on FormatException {} catch (e) {}
}
