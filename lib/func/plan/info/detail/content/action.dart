import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum ContentAction { action }

class ContentActionCreator {
  static Action onAction() {
    return const Action(ContentAction.action);
  }
}
