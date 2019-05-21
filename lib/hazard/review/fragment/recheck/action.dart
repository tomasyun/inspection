import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum RecheckInfoFragAction { action }

class RecheckInfoFragActionCreator {
  static Action onAction() {
    return const Action(RecheckInfoFragAction.action);
  }
}
