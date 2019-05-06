import 'package:barcode_scan/barcode_scan.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/services.dart';

import 'action.dart';
import 'state.dart';

Effect<InspectionTaskState> buildEffect() {
  return combineEffects(<Object, Effect<InspectionTaskState>>{
    InspectionTaskAction.action: _onAction,
    Lifecycle.initState: _onScanQRCode,
  });
}

void _onAction(Action action, Context<InspectionTaskState> ctx) {}

void _onScanQRCode(Action action, Context<InspectionTaskState> ctx) async {
  try {
    String qrResult = await BarcodeScanner.scan();
  } on PlatformException catch (ex) {
    if (ex.code == BarcodeScanner.CameraAccessDenied) {
    } else {}
  } on FormatException {} catch (e) {}
}
