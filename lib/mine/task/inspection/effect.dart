import 'package:barcode_scan/barcode_scan.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:inspection/device/repair/report/page.dart';
import 'package:inspection/global/app_common.dart';
import 'package:inspection/hazard/report/page.dart';

import 'action.dart';
import 'state.dart';

Effect<InspectionTaskState> buildEffect() {
  return combineEffects(<Object, Effect<InspectionTaskState>>{
    InspectionTaskAction.action: _onAction,
    Lifecycle.initState: _onScanQRCode,
    Lifecycle.didChangeDependencies: _onGetInspectionTask,
    InspectionTaskAction.sheet: _onShowBottomSheet,
    InspectionTaskAction.breakdownReport: _onBreakDownReport,
    InspectionTaskAction.hazardReport: _onHazardReport,
    InspectionTaskAction.submit: _onSubmit,
  });
}

void _onAction(Action action, Context<InspectionTaskState> ctx) {}

void _onSubmit(Action action, Context<InspectionTaskState> ctx) {
  AppCommons.showToast('暂未实现');
}

void _onBreakDownReport(Action action, Context<InspectionTaskState> ctx) {
  Navigator.of(ctx.context).push(MaterialPageRoute(builder: (context) {
    return ReportPage().buildPage(null);
  }));
}

void _onHazardReport(Action action, Context<InspectionTaskState> ctx) {
  Navigator.of(ctx.context).push(MaterialPageRoute(builder: (context) {
    return HazardReportPage().buildPage(null);
  }));
}

void _onShowBottomSheet(Action action, Context<InspectionTaskState> ctx) {
  showModalBottomSheet(
      context: ctx.context,
      builder: (builder) {
        return SingleChildScrollView(
          child: Container(
            child: Column(
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    ctx.dispatch(
                        InspectionTaskActionCreator.onBreakDownReport());
                  },
                  child: Container(
                    color: Colors.white,
                    padding: EdgeInsets.symmetric(vertical: 15.0),
                    alignment: AlignmentDirectional.center,
                    width: double.infinity,
                    child: Text(
                      '故障报修',
                      style: TextStyle(fontSize: 14.0, color: Colors.black),
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 0.5,
                  color: Colors.black45,
                ),
                GestureDetector(
                  onTap: () {
                    ctx.dispatch(InspectionTaskActionCreator.onHazardReport());
                  },
                  child: Container(
                    color: Colors.white,
                    padding: EdgeInsets.symmetric(vertical: 15.0),
                    alignment: AlignmentDirectional.center,
                    width: double.infinity,
                    child: Text(
                      '隐患上报',
                      style: TextStyle(fontSize: 14.0, color: Colors.black),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      });
}

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
