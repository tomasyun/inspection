import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum DetailAction { action }

class DetailActionCreator {
  static Action onAction() {
    return const Action(DetailAction.action);
  }
}
