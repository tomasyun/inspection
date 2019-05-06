import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:inspection/filter/page.dart';
import 'package:inspection/global/toast.dart';
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
  });
}

void _onAction(Action action, Context<HazardReportState> ctx) {}

void _onReport(Action action, Context<HazardReportState> ctx) {
//  AppToast.showToast('暂未实现');
  if (ctx.state.deviceNoController.text.isEmpty) {
    AppToast.showToast('设备编号不能为空');
  } else if (ctx.state.locationController.text.isEmpty) {
    AppToast.showToast('请填写隐患具体位置');
  } else if (ctx.state.levelRst == '等级') {
    AppToast.showToast('请选择隐患等级');
  } else if (ctx.state.typeRst == '类型') {
    AppToast.showToast('请选择隐患类型');
  } else if (ctx.state.decsController.text.isEmpty) {
    AppToast.showToast('请填写隐患描述');
  } else if (ctx.state.assets.isEmpty) {
    AppToast.showToast('请上传相关附件');
  } else {
    AppToast.showToast('暂未实现');
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
  } on PlatformException catch (e) {}

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
