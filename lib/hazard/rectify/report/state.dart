import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:multi_image_picker/multi_image_picker.dart';

class RectifyReportState implements Cloneable<RectifyReportState> {
  List<Asset> assets;
  TextEditingController controller;

  @override
  RectifyReportState clone() {
    return RectifyReportState()
      ..assets = assets
      ..controller = controller;
  }
}

RectifyReportState initState(Map<String, dynamic> args) {
  RectifyReportState state = RectifyReportState();
  state.assets = [];
  state.controller = TextEditingController();
  return state;
}
