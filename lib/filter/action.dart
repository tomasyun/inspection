import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum FilterAction { action, levels }

class FilterActionCreator {
  static Action onAction() {
    return const Action(FilterAction.action);
  }

  static Action onGetLevels(List<String> levels) {
    return Action(FilterAction.levels, payload: levels);
  }
}
