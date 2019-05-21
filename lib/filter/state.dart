import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:inspection/entity/filter_model.dart';

class FilterState implements Cloneable<FilterState> {
  BuildContext context;
  String flag;
  String departId;
  FilterModel model;

  @override
  FilterState clone() {
    return FilterState()
      ..context = context
      ..flag = flag
      ..model = model
      ..departId = departId;
  }
}

FilterState initState(Map<String, dynamic> args) {
  FilterState state = FilterState();
  state.flag = args['flag'];
  state.departId = args['departId'];
  return state;
}
