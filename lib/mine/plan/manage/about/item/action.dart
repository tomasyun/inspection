import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum PlanAboutItemAction { action }

class PlanAboutItemActionCreator {
  static Action onAction() {
    return const Action(PlanAboutItemAction.action);
  }
}
