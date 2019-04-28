import 'package:fish_redux/fish_redux.dart';
import 'package:inspection/entity/warning_model.dart';

//TODO replace with your own action
enum WarningAction { init, action }

class WarningActionCreator {
  static Action onAction() {
    return const Action(WarningAction.action);
  }

  static Action initState(List<WarningModel> list) {
    return Action(WarningAction.init, payload: list);
  }
}
