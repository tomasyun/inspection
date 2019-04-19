import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum TaskAction { action }

class TaskActionCreator {
  static Action onAction() {
    return const Action(TaskAction.action);
  }
}
