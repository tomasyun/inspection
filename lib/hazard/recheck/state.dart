import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:multi_image_picker/multi_image_picker.dart';

class RecheckReportState implements Cloneable<RecheckReportState> {
  List<Asset> assets;
  TextEditingController controller;

  @override
  RecheckReportState clone() {
    return RecheckReportState()
      ..assets = assets
      ..controller = controller;
  }
}

RecheckReportState initState(Map<String, dynamic> args) {
  RecheckReportState state = RecheckReportState();
  state.assets = [];
  state.controller = TextEditingController();
  return state;
}
