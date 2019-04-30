import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum RectifyInfoFragAction { action }

class RectifyInfoFragActionCreator {
  static Action onAction() {
    return const Action(RectifyInfoFragAction.action);
  }
}
