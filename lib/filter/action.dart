import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

//TODO replace with your own action
enum FilterAction { context, action, levels, types }

class FilterActionCreator {
  static Action onAction() {
    return const Action(FilterAction.action);
  }

  static Action onInitContext(BuildContext context) {
    return Action(FilterAction.context, payload: context);
  }

  static Action onGetLevels(List<String> levels) {
    return Action(FilterAction.levels, payload: levels);
  }

  static Action onGetTypes(List<String> types) {
    return Action(FilterAction.types, payload: types);
  }
}
