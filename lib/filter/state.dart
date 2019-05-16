import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:inspection/entity/level_model.dart';
import 'package:inspection/entity/type_model.dart';

class FilterState implements Cloneable<FilterState> {
  BuildContext context;
  String flag;
  LevelModel levelModel;
  TypeModel typeModel;
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
      ..applicants = applicants
      ..levelModel = levelModel
      ..typeModel = typeModel;
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
