import 'package:fish_redux/fish_redux.dart';
import 'package:inspection/entity/task_model.dart';

//TODO replace with your own action
enum TaskAction { action, toDos, scan }

class TaskActionCreator {
  static Action onAction() {
    return const Action(TaskAction.action);
  }

  static Action onGetToDos(TaskModel model) {
    return Action(TaskAction.toDos, payload: model);
  }

  static Action onScanQRCode() {
    return Action(TaskAction.scan);
  }
}
