import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:inspection/entity/hazard_model.dart';

class HazardState implements Cloneable<HazardState> {
  List<HazardModel> list = List<HazardModel>();
  GlobalKey<ScaffoldState> scaffoldKey;
  String startDate;
  String endDate;
  String state;

  @override
  HazardState clone() {
    return HazardState()
      ..list = list
      ..scaffoldKey = scaffoldKey
      ..startDate = startDate
      ..endDate = endDate
      ..state = state;
  }
}

HazardState initState(Map<String, dynamic> args) {
  HazardState state = HazardState();
  state.scaffoldKey = GlobalKey<ScaffoldState>();
  state.startDate = '请选择';
  state.endDate = '请选择';
  state.state = '请选择';
  return state;
}
