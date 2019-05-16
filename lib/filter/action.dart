import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:inspection/entity/level_model.dart';
import 'package:inspection/entity/type_model.dart';

//TODO replace with your own action
enum FilterAction { context, action, levels, types, departs, applicants }

class FilterActionCreator {
  static Action onAction() {
    return const Action(FilterAction.action);
  }

  static Action onInitContext(BuildContext context) {
    return Action(FilterAction.context, payload: context);
  }

  static Action onGetLevels(LevelModel levels) {
    return Action(FilterAction.levels, payload: levels);
  }

  static Action onGetTypes(TypeModel types) {
    return Action(FilterAction.types, payload: types);
  }

  static Action onGetDeparts(List<String> departs) {
    return Action(FilterAction.departs, payload: departs);
  }

  static Action onGetApplicants(List<String> applicants) {
    return Action(FilterAction.applicants, payload: applicants);
  }
}
