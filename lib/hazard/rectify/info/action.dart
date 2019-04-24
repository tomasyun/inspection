import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum RectifyInfoAction { action }

class RectifyInfoActionCreator {
  static Action onAction() {
    return const Action(RectifyInfoAction.action);
  }
}
