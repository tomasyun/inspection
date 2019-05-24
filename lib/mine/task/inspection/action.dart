import 'package:fish_redux/fish_redux.dart';
import 'package:inspection/entity/inspect_content_model.dart';

//TODO replace with your own action
enum InspectionTaskAction {
  action,
  model,
  sheet,
  breakdownReport,
  hazardReport,
  submit,
  deviceInfo,
}

class InspectionTaskActionCreator {
  static Action onAction() {
    return const Action(InspectionTaskAction.action);
  }

  static Action onGetInspectionTasks(InspectContentModel model) {
    return Action(InspectionTaskAction.model, payload: model);
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

  static Action onGetDeviceInfoAction(Map<String, String> map) {
    return Action(InspectionTaskAction.deviceInfo, payload: map);
  }
}
