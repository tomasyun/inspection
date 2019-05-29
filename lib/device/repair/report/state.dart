import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

class ReportState implements Cloneable<ReportState> {
  TextEditingController descController;
  TextEditingController deviceNoController;
  TextEditingController deviceNameController;
  Map<String, String> departRst = Map();
  Map<String, String> picRst = Map();
  Map<String, String> repairManRst = Map();
  String repairDateRst;
  Map<String, String> deviceInfo = Map();

  @override
  ReportState clone() {
    return ReportState()
      ..descController = descController
      ..deviceNoController = deviceNoController
      ..deviceNameController = deviceNameController
      ..departRst = departRst
      ..picRst = picRst
      ..repairManRst = repairManRst
      ..repairDateRst = repairDateRst
      ..deviceInfo = deviceInfo;
  }
}

ReportState initState(Map<String, dynamic> args) {
  ReportState state = ReportState();
  state.descController = TextEditingController();
  state.deviceNameController = TextEditingController();
  state.deviceNoController = TextEditingController();
  state.departRst = {'name': '请选择', 'id': ''};
  state.picRst = {'name': '请选择', 'id': ''};
  state.repairManRst = {'name': '请选择', 'id': ''};
  state.repairDateRst = '请选择';
  state.deviceInfo['deviceName'] = '扫码获取';
  state.deviceInfo['deviceCode'] = '扫码获取';
  state.deviceInfo['deviceId'] = '';

  return state;
}
