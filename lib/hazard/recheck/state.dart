import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:multi_image_picker/multi_image_picker.dart';

class RecheckReportState implements Cloneable<RecheckReportState> {
  List<Asset> assets;
  TextEditingController controller;
  String id;
  String recheckFormId;

  @override
  RecheckReportState clone() {
    return RecheckReportState()
      ..assets = assets
      ..controller = controller
      ..id = id
      ..recheckFormId = recheckFormId;
  }
}

RecheckReportState initState(Map<String, dynamic> args) {
  RecheckReportState state = RecheckReportState();
  state.assets = [];
  state.controller = TextEditingController();
  state.id = args['id'];
  return state;
}
