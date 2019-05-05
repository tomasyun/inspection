import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

class FilterState implements Cloneable<FilterState> {
  BuildContext context;
  String flag;
  List<String> levels;
  List<String> types;
  String selected;

  @override
  FilterState clone() {
    return FilterState()
      ..context = context
      ..flag = flag
      ..levels = levels
      ..types = types
      ..selected = selected;
  }
}

FilterState initState(Map<String, dynamic> args) {
  FilterState state = FilterState();
  state.flag = args['flag'];
  return state;
}
