import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum InspectionTaskAction { action }

class InspectionTaskActionCreator {
  static Action onAction() {
    return const Action(InspectionTaskAction.action);
  }
}
