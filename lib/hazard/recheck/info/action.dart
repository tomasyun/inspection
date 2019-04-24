import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum RecheckInfoAction { action }

class RecheckInfoActionCreator {
  static Action onAction() {
    return const Action(RecheckInfoAction.action);
  }
}
