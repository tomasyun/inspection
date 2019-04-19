import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum UpdatePasswordAction { action }

class UpdatePasswordActionCreator {
  static Action onAction() {
    return const Action(UpdatePasswordAction.action);
  }
}
