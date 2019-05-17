import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:inspection/entity/hazard_model.dart';

class HazardState implements Cloneable<HazardState> {
  HazardModel model;
  GlobalKey<ScaffoldState> scaffoldKey;
  String startDate;
  String endDate;
  String state;
  Map<String, String> map = Map();
  BuildContext context;
  @override
  HazardState clone() {
    return HazardState()
      ..model = model
      ..scaffoldKey = scaffoldKey
      ..startDate = startDate
      ..endDate = endDate
      ..state = state
      ..map = map
      ..context = context;
  }
}

HazardState initState(Map<String, dynamic> args) {
  HazardState state = HazardState();
  state.scaffoldKey = GlobalKey<ScaffoldState>();
  state.state = '请选择';
  state.startDate = '请选择';
  state.endDate = '请选择';
  return state;
}
