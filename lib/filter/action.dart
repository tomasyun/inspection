import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum FilterAction { action }

class FilterActionCreator {
  static Action onAction() {
    return const Action(FilterAction.action);
  }
}
