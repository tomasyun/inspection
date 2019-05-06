import 'package:barcode_scan/barcode_scan.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:inspection/device/keep/page.dart';
import 'package:inspection/device/repair/record/page.dart';

import 'action.dart';
import 'state.dart';

Effect<InfoState> buildEffect() {
  return combineEffects(<Object, Effect<InfoState>>{
    InfoAction.action: _onAction,
    Lifecycle.initState: _onScanQRCode,
    InfoAction.repairRecord: _onSkipRepairRecord,
    InfoAction.keepRecord: _onSkipKeepRecord,
  });
}

void _onAction(Action action, Context<InfoState> ctx) {}

void _onScanQRCode(Action action, Context<InfoState> ctx) async {
  try {
    String qrResult = await BarcodeScanner.scan();
  } on PlatformException catch (ex) {
    if (ex.code == BarcodeScanner.CameraAccessDenied) {
    } else {}
  } on FormatException {} catch (e) {}
}

void _onSkipRepairRecord(Action action, Context<InfoState> ctx) {
  Navigator.of(ctx.context).push(MaterialPageRoute(builder: (context) {
    return RecordPage().buildPage(null);
  }));
}

void _onSkipKeepRecord(Action action, Context<InfoState> ctx) {
  Navigator.of(ctx.context).push(MaterialPageRoute(builder: (context) {
    return KeepPage().buildPage(null);
  }));
}
