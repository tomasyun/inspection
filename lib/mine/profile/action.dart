import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum ProfileAction { action }

class ProfileActionCreator {
  static Action onAction() {
    return const Action(ProfileAction.action);
  }
}
