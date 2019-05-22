import 'dart:convert' show json;

import 'package:dio/dio.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/services.dart';
import 'package:inspection/global/app_common.dart';
import 'package:inspection/global/dico_http.dart';
import 'package:multi_image_picker/multi_image_picker.dart';

import 'action.dart';
import 'state.dart';

Effect<RecheckReportState> buildEffect() {
  return combineEffects(<Object, Effect<RecheckReportState>>{
    RecheckReportAction.action: _onAction,
    RecheckReportAction.addAttachment: _onAddAttachmentClick,
    RecheckReportAction.report: _onReport,
    Lifecycle.initState: _onInit,
  });
}

void _onAction(Action action, Context<RecheckReportState> ctx) {}

void _onInit(Action action, Context<RecheckReportState> ctx) {
  DicoHttpRepository.doGetRecheckFormRequest(ctx.state.id).then((map) {
    if (map['code'] == 0) {
      if (map['data'] != null && map['data']['id'] != null) {
        ctx.dispatch(
            RecheckReportActionCreator.onGetRecheckFormId(map['data']['id']));
      }
    } else {
      AppCommons.showToast(map['msg']);
    }
  });
}

void _onReport(Action action, Context<RecheckReportState> ctx) async {
  if (ctx.state.controller.text.isEmpty) {
    AppCommons.showToast('请填写复查情况');
  } else if (ctx.state.assets.isEmpty) {
    AppCommons.showToast('请上传相关附件');
  } else {
    String decs = ctx.state.controller.text;
    String recheckFormId = ctx.state.recheckFormId;
    Map<String, dynamic> map = Map();
    map['reviewResult'] = decs;
    map['id'] = recheckFormId;
    map['dangerId'] = ctx.state.id;
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
        FormData.from({'dangerReviewStr': json.encode(map), 'file': files});
    DicoHttpRepository.doSendRecheckReport(data).then((map) {
      if (map['code'] == 0) {
        AppCommons.showToast('上报成功');
      } else {
        AppCommons.showToast('上报失败');
      }
    });
  }
}

void _onAddAttachmentClick(
    Action action, Context<RecheckReportState> ctx) async {
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

  ctx.dispatch(RecheckReportActionCreator.onPickImages(assets));
}
