import 'dart:convert' show json;

import 'package:barcode_scan/barcode_scan.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:inspection/device/repair/report/page.dart';
import 'package:inspection/entity/inspect_content_req_model.dart';
import 'package:inspection/global/app_common.dart';
import 'package:inspection/global/dico_http.dart';
import 'package:inspection/hazard/report/page.dart';

import 'action.dart';
import 'state.dart';

Effect<InspectionTaskState> buildEffect() {
  return combineEffects(<Object, Effect<InspectionTaskState>>{
    InspectionTaskAction.action: _onAction,
    Lifecycle.initState: _onScanQRCode,
    InspectionTaskAction.sheet: _onShowBottomSheet,
    InspectionTaskAction.breakdownReport: _onBreakDownReport,
    InspectionTaskAction.hazardReport: _onHazardReport,
    InspectionTaskAction.submit: _onSubmit,
  });
}

void _onAction(Action action, Context<InspectionTaskState> ctx) {}

void _onSubmit(Action action, Context<InspectionTaskState> ctx) {
  List<TargetResults> targetResults = [];
  if (ctx.state.model.data.isNotEmpty) {
    var list = ctx.state.model.data;
    for (int i = 0; i < list.length; i++) {
      TargetResults results = TargetResults(
          inspectionResult: list[i].isOpen,
          targetContent: list[i].targetName,
          targetId: list[i].targetId);
      targetResults.add(results);
    }
  }
  InspectContentReqModel model = InspectContentReqModel(
      equipmentId: ctx.state.map['deviceId'],
      planId: ctx.state.equipmentId,
      targetResults: targetResults);

  DicoHttpRepository.doSaveInspectItemRequest(json.encode(model.toJson()))
      .then((map) {
    AppCommons.showToast(map['data']);
  });
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

void _onScanQRCode(Action action, Context<InspectionTaskState> ctx) async {
  try {
    String qrResult = await BarcodeScanner.scan();
    if (ctx.state.equipmentId != null) {
      ctx.state.equipmentId == ''
          ? DicoHttpRepository.scanQRCodeRequest(qrResult).then((model) {
              if (model.code == 0) {
                if (model.data != null) {
                  Map<String, String> map = Map();
                  map['deviceId'] = '';
                  map['deviceName'] = '';
                  map['deviceTypeId'] = '';
                  map['planId'] = '';
                  if (model.data.id != null) {
                    map['deviceId'] = model.data.id;
                  }
                  if (model.data.equipmentName != null) {
                    map['deviceName'] = model.data.equipmentName;
                  }
                  if (model.data.equipmentType != null &&
                      model.data.planId != null) {
                    map['deviceTypeId'] = model.data.equipmentType;
                    map['planId'] = model.data.planId;
                    DicoHttpRepository.doGetInspectItemRequest(
                            model.data.equipmentType, model.data.planId)
                        .then((model) {
                      if (model.code == 0) {
                        ctx.dispatch(
                            InspectionTaskActionCreator.onGetInspectionTasks(
                                model));
                      } else {
                        AppCommons.showToast('获取巡检内容失败');
                      }
                    });
                  }
                  ctx.dispatch(
                      InspectionTaskActionCreator.onGetDeviceInfoAction(map));
                  AppCommons.showToast('改设备暂未添加巡检任务');
                }
              } else {
                AppCommons.showToast('扫码失败');
              }
            })
          : DicoHttpRepository.scanQRCodeRequest(qrResult).then((model) {
              if (model.code == 0) {
                if (model.data != null) {
                  Map<String, String> map = Map();
                  map['deviceId'] = '';
                  map['deviceName'] = '';
                  map['deviceTypeId'] = '';
                  if (model.data.id != null) {
                    map['deviceId'] = model.data.id;
                    if (model.data.id == ctx.state.equipmentId) {
                      if (model.data.equipmentType != null) {
                        map['deviceTypeId'] = model.data.equipmentType;
                        DicoHttpRepository.doGetInspectItemRequest(
                                model.data.equipmentType, model.data.planId)
                            .then((model) {
                          if (model.code == 0) {
                            ctx.dispatch(InspectionTaskActionCreator
                                .onGetInspectionTasks(model));
                          } else {
                            AppCommons.showToast('获取巡检内容失败');
                          }
                        });
                      }
                      if (model.data.planId != null) {
                        map['planId'] = model.data.planId;
                      }
                      if (model.data.equipmentName != null) {
                        map['deviceName'] = model.data.equipmentName;
                      }
                      ctx.dispatch(
                          InspectionTaskActionCreator.onGetDeviceInfoAction(
                              map));
                    } else {
                      AppCommons.showToast('获取巡检内容失败');
                    }
                  }
                }
              } else {
                AppCommons.showToast('扫码失败');
              }
            });
    }
  } on PlatformException catch (ex) {
    if (ex.code == BarcodeScanner.CameraAccessDenied) {
    } else {}
  } on FormatException {} catch (e) {}
}
