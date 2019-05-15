import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum InspectPlanItemAction { action, skipAbout }

class InspectPlanItemActionCreator {
  static Action onAction() {
    return const Action(InspectPlanItemAction.action);
  }

  static Action onSkipAboutPage() {
    return Action(InspectPlanItemAction.skipAbout);
  }
}
