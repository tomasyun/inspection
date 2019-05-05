import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/services.dart';
import 'package:multi_image_picker/multi_image_picker.dart';

import 'action.dart';
import 'state.dart';

Effect<RecheckReportState> buildEffect() {
  return combineEffects(<Object, Effect<RecheckReportState>>{
    RecheckReportAction.action: _onAction,
    RecheckReportAction.addAttachment: _onAddAttachmentClick,
  });
}

void _onAction(Action action, Context<RecheckReportState> ctx) {}
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
