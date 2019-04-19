import 'package:fish_redux/fish_redux.dart';

class TaskState implements Cloneable<TaskState> {
  @override
  TaskState clone() {
    return TaskState();
  }
}

TaskState initState(Map<String, dynamic> args) {
  return TaskState();
}
