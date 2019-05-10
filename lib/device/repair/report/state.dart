import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

class ReportState implements Cloneable<ReportState> {
  TextEditingController controller;
  String departRst;
  String applicantRst;

  @override
  ReportState clone() {
    return ReportState()
      ..controller = controller
      ..departRst = departRst
      ..applicantRst = applicantRst;
  }
}

ReportState initState(Map<String, dynamic> args) {
  ReportState state = ReportState();
  state.controller = TextEditingController();
  state.departRst = '请选择';
  state.applicantRst = '请选择';
  return state;
}
