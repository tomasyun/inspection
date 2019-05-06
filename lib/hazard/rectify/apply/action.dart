import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum CostApplyAction { action, report }

class CostApplyActionCreator {
  static Action onAction() {
    return const Action(CostApplyAction.action);
  }

  static Action onReport() {
    return Action(CostApplyAction.report);
  }
}
