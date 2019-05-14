import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

class ReportState implements Cloneable<ReportState> {
  TextEditingController descController;
  TextEditingController deviceNoController;

  String departRst;
  String applicantRst;

  @override
  ReportState clone() {
    return ReportState()
      ..descController = descController
      ..deviceNoController = deviceNoController
      ..departRst = departRst
      ..applicantRst = applicantRst;
  }
}

ReportState initState(Map<String, dynamic> args) {
  ReportState state = ReportState();
  state.descController = TextEditingController();
  state.deviceNoController = TextEditingController();
  state.departRst = '请选择';
  state.applicantRst = '请选择';
  return state;
}
