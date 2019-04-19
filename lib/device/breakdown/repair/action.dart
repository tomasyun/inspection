import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum RepairAction { action }

class RepairActionCreator {
  static Action onAction() {
    return const Action(RepairAction.action);
  }
}
