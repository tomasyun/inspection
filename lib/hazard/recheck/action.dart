import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum RecheckAction { action }

class RecheckActionCreator {
  static Action onAction() {
    return const Action(RecheckAction.action);
  }
}
