import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum WarningAction { action }

class WarningActionCreator {
  static Action onAction() {
    return const Action(WarningAction.action);
  }
}
