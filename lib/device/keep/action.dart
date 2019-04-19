import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum KeepAction { action }

class KeepActionCreator {
  static Action onAction() {
    return const Action(KeepAction.action);
  }
}
