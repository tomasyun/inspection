import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum InspectionTaskAction { action, tasks }

class InspectionTaskActionCreator {
  static Action onAction() {
    return const Action(InspectionTaskAction.action);
  }

  static Action onGetInspectionTasks(List<String> list) {
    return Action(InspectionTaskAction.tasks, payload: list);
  }
}
