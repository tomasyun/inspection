import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:inspection/entity/plan_model.dart';

class InspectPlanState implements Cloneable<InspectPlanState> {
  PlanModel model;
  GlobalKey<ScaffoldState> scaffoldKey;
  String planState;
  Map<String, String> map = Map();
  TextEditingController controller;

  @override
  InspectPlanState clone() {
    return InspectPlanState()
      ..model = model
      ..scaffoldKey = scaffoldKey
      ..planState = planState
      ..map = map
      ..controller = controller;
  }
}

InspectPlanState initState(Map<String, dynamic> args) {
  InspectPlanState state = InspectPlanState();
  state.scaffoldKey = GlobalKey<ScaffoldState>();
  state.planState = '请选择';
  state.controller = TextEditingController();
  return state;
}
