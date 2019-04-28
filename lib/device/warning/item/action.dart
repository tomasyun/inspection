import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum WarningItemAction { action }

class WarningItemActionCreator {
  static Action onAction() {
    return const Action(WarningItemAction.action);
  }
}
