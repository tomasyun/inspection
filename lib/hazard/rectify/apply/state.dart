import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

class CostApplyState implements Cloneable<CostApplyState> {
  TextEditingController costController;
  TextEditingController decsController;

  @override
  CostApplyState clone() {
    return CostApplyState()
      ..costController = costController
      ..decsController = decsController;
  }
}

CostApplyState initState(Map<String, dynamic> args) {
  CostApplyState state = CostApplyState();
  state.costController = TextEditingController();
  state.decsController = TextEditingController();
  return state;
}
