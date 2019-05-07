import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum InspectionTaskAction {
  action,
  tasks,
  sheet,
  breakdownReport,
  hazardReport,
  submit,
}

class InspectionTaskActionCreator {
  static Action onAction() {
    return const Action(InspectionTaskAction.action);
  }

  static Action onGetInspectionTasks(List<String> list) {
    return Action(InspectionTaskAction.tasks, payload: list);
  }

  static Action onShowBottomSheet() {
    return Action(InspectionTaskAction.sheet);
  }

  static Action onBreakDownReport() {
    return Action(InspectionTaskAction.breakdownReport);
  }

  static Action onHazardReport() {
    return Action(InspectionTaskAction.hazardReport);
  }

  static Action onSubmit() {
    return Action(InspectionTaskAction.submit);
  }
}
