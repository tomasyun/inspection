import 'package:fish_redux/fish_redux.dart';
import 'package:inspection/entity/todos_model.dart';

class TaskState implements Cloneable<TaskState> {
  ToDosModel model;
  @override
  TaskState clone() {
    return TaskState()..model = model;
  }
}

TaskState initState(Map<String, dynamic> args) {
  return TaskState();
}
