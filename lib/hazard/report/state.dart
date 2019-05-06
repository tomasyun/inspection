import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:multi_image_picker/multi_image_picker.dart';

class HazardReportState implements Cloneable<HazardReportState> {
  String levelRst;
  String typeRst;
  List<Asset> assets;
  TextEditingController deviceNoController;
  TextEditingController locationController;
  TextEditingController decsController;

  @override
  HazardReportState clone() {
    return HazardReportState()
      ..levelRst = levelRst
      ..typeRst = typeRst
      ..assets = assets
      ..deviceNoController = deviceNoController
      ..locationController = locationController
      ..decsController = decsController;
  }
}

HazardReportState initState(Map<String, dynamic> args) {
  HazardReportState state = HazardReportState();
  state.levelRst = '等级';
  state.typeRst = '类型';
  state.assets = [];
  state.deviceNoController = TextEditingController();
  state.locationController = TextEditingController();
  state.decsController = TextEditingController();
  return state;
}
