import 'dart:convert' show json;

import 'package:barcode_scan/barcode_scan.dart';
import 'package:dio/dio.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:inspection/filter/page.dart';
import 'package:inspection/global/app_common.dart';
import 'package:inspection/global/dico_http.dart';
import 'package:multi_image_picker/multi_image_picker.dart';

import 'action.dart';
import 'state.dart';

Effect<HazardReportState> buildEffect() {
  return combineEffects(<Object, Effect<HazardReportState>>{
    HazardReportAction.action: _onAction,
    HazardReportAction.level: _onLevelSkipFilter,
    HazardReportAction.type: _onTypeSkipFilter,
    HazardReportAction.addAttachment: _onAddAttachmentClick,
    HazardReportAction.report: _onReport,
    HazardReportAction.scanQRCode: _onScanQRCode,
  });
}

void _onAction(Action action, Context<HazardReportState> ctx) {}

void _onScanQRCode(Action action, Context<HazardReportState> ctx) async {
  try {
    String qrResult = await BarcodeScanner.scan();
    if (qrResult != null && qrResult.isNotEmpty) {
      DicoHttpRepository.scanQRCodeRequest(qrResult).then((model) {
        if (model.code == 0) {
          if (model != null && model.data != null) {
            Map<String, String> map = Map();
            map['deviceCode'] = '扫码获取';
            map['deviceId'] = '';
            map['deviceName'] = '';
            map['deviceLocation'] = '隐患具体位置';
            if (model.data.equipmentCode != null) {
              map['deviceCode'] = model.data.equipmentCode;
            }
            if (model.data.id != null) {
              map['deviceId'] = model.data.id;
            }
            if (model.data.equipmentName != null) {
              map['deviceName'] = model.data.equipmentName;
            }
            if (model.data.installArea != null) {
              map['deviceLocation'] = model.data.installArea;
            }
            ctx.dispatch(HazardReportActionCreator.onDeviceCodeAction(map));
          }
        }
      });
    }
  } on PlatformException catch (ex) {
    if (ex.code == BarcodeScanner.CameraAccessDenied) {
    } else {}
  } on FormatException {} catch (e) {}
}

void _onReport(Action action, Context<HazardReportState> ctx) async {
  if (ctx.state.map['deviceCode'] == '扫码获取' ||
      ctx.state.map['deviceLocation'] == '隐患具体位置') {
    AppCommons.showToast('请先扫码获取设备编号和隐患位置');
  } else if (ctx.state.levelRst['name'] == '请选择') {
    AppCommons.showToast('请选择隐患等级');
  } else if (ctx.state.typeRst['name'] == '请选择') {
    AppCommons.showToast('请选择隐患类型');
  } else if (ctx.state.decsController.text.isEmpty) {
    AppCommons.showToast('请填写隐患描述');
  } else if (ctx.state.assets.isEmpty) {
    AppCommons.showToast('请上传相关附件');
  } else {
    String location = ctx.state.map['deviceLocation'];
    String deviceNo = ctx.state.map['deviceId'];
    String deviceName = ctx.state.map['deviceName'];
    String level = ctx.state.levelRst['id'];
    String levelName = ctx.state.levelRst['name'];
    String type = ctx.state.typeRst['id'];
    String typeName = ctx.state.typeRst['name'];
    String desc = ctx.state.decsController.text;
    Map<String, String> map = Map();
    map['dangerAddress'] = location;
    map['equipmentId'] = deviceNo;
    map['equipmentName'] = deviceName;
    map['dangerLevelId'] = level;
    map['dangerLevelName'] = levelName;
    map['dangerTypeId'] = type;
    map['dangerTypeName'] = typeName;
    map['remark'] = desc;
    List<UploadFileInfo> files = [];
    if (ctx.state.assets != null && ctx.state.assets.isNotEmpty) {
      for (int i = 0; i < ctx.state.assets.length; i++) {
        ByteData byteData = await ctx.state.assets[i].requestOriginal();
        List<int> imageData = byteData.buffer.asUint8List();
        files
            .add(UploadFileInfo.fromBytes(imageData, ctx.state.assets[i].name));
      }
    }
    FormData data =
        FormData.from({'smsDangerInfoStr': json.encode(map), 'file': files});
    DicoHttpRepository.hazardReportRequest(data).then((map) {
      if (map['code'] == 0) {
        AppCommons.showToast('保存成功');
      } else {
        AppCommons.showToast(map['msg']);
      }
    });
  }
}

void _onAddAttachmentClick(
    Action action, Context<HazardReportState> ctx) async {
  List<Asset> assets = [];
  try {
    assets = await MultiImagePicker.pickImages(
        maxImages: 3,
        enableCamera: true,
        cupertinoOptions: CupertinoOptions(takePhotoIcon: "chat"),
        materialOptions: MaterialOptions(
          actionBarColor: "#abcdef",
          actionBarTitle: "Example App",
          allViewTitle: "All Photos",
          selectCircleStrokeColor: "#000000",
        ));
  } on PlatformException catch (e) {
    AppCommons.showToast(e.message);
  }

  ctx.dispatch(HazardReportActionCreator.onPickImages(assets));
}

void _onLevelSkipFilter(Action action, Context<HazardReportState> ctx) {
  Future future =
      Navigator.of(ctx.context).push(MaterialPageRoute(builder: (context) {
    Map<String, dynamic> map = {'flag': 'level'};
    return FilterPage().buildPage(map);
  }));
  future.then((value) {
    if (value != null) {
      ctx.dispatch(HazardReportActionCreator.onGetLevelRst(value));
    }
  });
}

void _onTypeSkipFilter(Action action, Context<HazardReportState> ctx) {
  Future future =
      Navigator.of(ctx.context).push(MaterialPageRoute(builder: (context) {
    Map<String, dynamic> map = {'flag': 'type'};
    return FilterPage().buildPage(map);
  }));
  future.then((value) {
    if (value != null) {
      ctx.dispatch(HazardReportActionCreator.onGetTypeRst(value));
    }
  });
}
