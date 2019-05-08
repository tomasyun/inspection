import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:inspection/entity/hazard_model.dart';

class HazardState implements Cloneable<HazardState> {
  List<HazardModel> list = List<HazardModel>();
  GlobalKey<ScaffoldState> scaffoldKey;
  @override
  HazardState clone() {
    return HazardState()
      ..list = list
      ..scaffoldKey = scaffoldKey;
  }
}

HazardState initState(Map<String, dynamic> args) {
  HazardState state = HazardState();
  state.scaffoldKey = GlobalKey<ScaffoldState>();
  return state;
}
