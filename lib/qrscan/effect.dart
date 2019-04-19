import 'package:barcode_scan/barcode_scan.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'action.dart';
import 'state.dart';

Effect<QRScanState> buildEffect() {
  return combineEffects(<Object, Effect<QRScanState>>{
    Lifecycle.initState: _onAction,
  });
}

void _onAction(Action action, Context<QRScanState> ctx) async {
  debugPrint("scan touched");
  try {
    String qrResult = await BarcodeScanner.scan();
    ctx.dispatch(QRScanActionCreator.onAction(qrResult));
  } on PlatformException catch (ex) {
    if (ex.code == BarcodeScanner.CameraAccessDenied) {
      ctx.dispatch(QRScanActionCreator.onAction("The permission was denied."));
    } else {
      ctx.dispatch(QRScanActionCreator.onAction("unknown error ocurred $ex"));
    }
  } on FormatException {
    ctx.dispatch(QRScanActionCreator.onAction("Scan canceled, try again !"));
  } catch (e) {
    ctx.dispatch(QRScanActionCreator.onAction("Unknown error $e"));
  }
}
