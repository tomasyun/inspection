import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:multi_image_picker/multi_image_picker.dart';

class HazardReportState implements Cloneable<HazardReportState> {
  Map<String, String> levelRst;
  Map<String, String> typeRst;
  List<Asset> assets;
  TextEditingController deviceNoController;
  TextEditingController locationController;
  TextEditingController decsController;
  Map<String, String> deviceInfo = Map();

  @override
  HazardReportState clone() {
    return HazardReportState()
      ..levelRst = levelRst
      ..typeRst = typeRst
      ..assets = assets
      ..deviceNoController = deviceNoController
      ..locationController = locationController
      ..decsController = decsController
      ..deviceInfo = deviceInfo;
  }
}

HazardReportState initState(Map<String, dynamic> args) {
  HazardReportState state = HazardReportState();
  state.levelRst = {'name': '请选择', 'id': ''};
  state.typeRst = {'name': '请选择', 'id': ''};
  state.assets = [];
  state.deviceNoController = TextEditingController();
  state.locationController = TextEditingController();
  state.decsController = TextEditingController();
  state.deviceInfo['deviceCode'] = '扫码获取';
  state.deviceInfo['deviceId'] = '';
  state.deviceInfo['deviceLocation'] = '隐患具体位置';
  state.deviceInfo['deviceName'] = '';
  return state;
}
