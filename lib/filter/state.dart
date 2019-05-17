import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:inspection/entity/filter_model.dart';

class FilterState implements Cloneable<FilterState> {
  BuildContext context;
  String flag;
  FilterModel filterModel;
  List<String> departs;
  List<String> applicants;

  @override
  FilterState clone() {
    return FilterState()
      ..context = context
      ..flag = flag
      ..departs = departs
      ..applicants = applicants;
  }
}

FilterState initState(Map<String, dynamic> args) {
  FilterState state = FilterState();
  state.flag = args['flag'];
  state.departs = [];
  state.applicants = [];
  return state;
}
