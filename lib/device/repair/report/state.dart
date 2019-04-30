import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

class ReportState implements Cloneable<ReportState> {
  TextEditingController controller;
  @override
  ReportState clone() {
    return ReportState()..controller = controller;
  }
}

ReportState initState(Map<String, dynamic> args) {
  ReportState state = ReportState();
  state.controller = TextEditingController();
  return state;
}
