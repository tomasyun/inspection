import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum MinePlanItemAction { action, skipAbout }

class MinePlanItemActionCreator {
  static Action onAction() {
    return const Action(MinePlanItemAction.action);
  }

  static Action onSkipAbout() {
    return Action(MinePlanItemAction.skipAbout);
  }
}
