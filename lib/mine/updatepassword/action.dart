import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum UpdatePasswordAction { action, update }

class UpdatePasswordActionCreator {
  static Action onAction() {
    return const Action(UpdatePasswordAction.action);
  }

  static Action onUpdate() {
    return Action(UpdatePasswordAction.update);
  }
}
