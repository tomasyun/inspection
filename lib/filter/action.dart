import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:inspection/entity/filter_model.dart';

//TODO replace with your own action
enum FilterAction { context, action, model, departs, applicants }

class FilterActionCreator {
  static Action onAction() {
    return const Action(FilterAction.action);
  }

  static Action onInitContext(BuildContext context) {
    return Action(FilterAction.context, payload: context);
  }

  static Action onGetFilterModel(FilterModel levels) {
    return Action(FilterAction.model, payload: levels);
  }

  static Action onGetDeparts(List<String> departs) {
    return Action(FilterAction.departs, payload: departs);
  }

  static Action onGetApplicants(List<String> applicants) {
    return Action(FilterAction.applicants, payload: applicants);
  }
}
