import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

class FilterState implements Cloneable<FilterState> {
  BuildContext context;
  String flag;
  List<String> levels;
  List<String> types;
  List<String> departs;
  List<String> applicants;

  @override
  FilterState clone() {
    return FilterState()
      ..context = context
      ..flag = flag
      ..levels = levels
      ..types = types
      ..departs = departs
      ..applicants = applicants;
  }
}

FilterState initState(Map<String, dynamic> args) {
  FilterState state = FilterState();
  state.flag = args['flag'];
  state.levels = [];
  state.types = [];
  state.departs = [];
  state.applicants = [];
  return state;
}
