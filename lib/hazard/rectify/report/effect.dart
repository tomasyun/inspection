import 'dart:convert' show json;

import 'package:dio/dio.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/services.dart';
import 'package:inspection/global/app_common.dart';
import 'package:inspection/global/dico_http.dart';
import 'package:multi_image_picker/multi_image_picker.dart';

import 'action.dart';
import 'state.dart';

Effect<RectifyReportState> buildEffect() {
  return combineEffects(<Object, Effect<RectifyReportState>>{
    RectifyReportAction.action: _onAction,
    RectifyReportAction.addAttachment: _onAddAttachmentClick,
    RectifyReportAction.report: _onReport,
    Lifecycle.initState: _onInit,
  });
}

void _onAction(Action action, Context<RectifyReportState> ctx) {}

void _onInit(Action action, Context<RectifyReportState> ctx) {
  DicoHttpRepository.doGetRectifyFormRequest(ctx.state.id).then((model) {
    if (model.code == 0) {
      if (model.data != null) {
        Map<String, String> map = Map();
        map['opinion'] = model.data.repairOpinion;
        map['formId'] = model.data.id;
        ctx.dispatch(RectifyReportActionCreator.onGetRectifyFormAction(map));
      }
    }
  });
}

void _onReport(Action action, Context<RectifyReportState> ctx) async {
  if (ctx.state.controller.text.isEmpty) {
    AppCommons.showToast('请填写整改情况');
  } else if (ctx.state.assets.isEmpty) {
    AppCommons.showToast('请上传相关附件');
  } else {
    String dangerId = ctx.state.id;
    String decs = ctx.state.controller.text;
    String rectifyFormId = ctx.state.map['formId'];
    Map<String, dynamic> map = Map();
    map['id'] = rectifyFormId;
    map['dangerId'] = dangerId;
    map['repairResult'] = decs;
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
        FormData.from({'dangerRepairStr': json.encode(map), 'file': files});
    DicoHttpRepository.doSendRectifyReport(data).then((map) {
      if (map['code'] == 0) {
        AppCommons.showToast('上报成功');
      } else {
        AppCommons.showToast('上报失败');
      }
    });
  }
}

void _onAddAttachmentClick(
    Action action, Context<RectifyReportState> ctx) async {
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
  } on PlatformException catch (e) {}

  ctx.dispatch(RectifyReportActionCreator.onPickImages(assets));
}
