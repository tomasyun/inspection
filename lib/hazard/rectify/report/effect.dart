import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/services.dart';
import 'package:inspection/global/app_common.dart';
import 'package:multi_image_picker/multi_image_picker.dart';

import 'action.dart';
import 'state.dart';

Effect<RectifyReportState> buildEffect() {
  return combineEffects(<Object, Effect<RectifyReportState>>{
    RectifyReportAction.action: _onAction,
    RectifyReportAction.addAttachment: _onAddAttachmentClick,
    RectifyReportAction.report: _onReport,
  });
}

void _onAction(Action action, Context<RectifyReportState> ctx) {}

void _onReport(Action action, Context<RectifyReportState> ctx) {
//  AppToast.showToast('暂未实现');
  if (ctx.state.controller.text.isEmpty) {
    AppCommons.showToast('请填写整改情况');
  } else if (ctx.state.assets.isEmpty) {
    AppCommons.showToast('请上传相关附件');
  } else {
    AppCommons.showToast('暂未实现');
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
