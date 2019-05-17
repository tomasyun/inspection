import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:inspection/entity/task_model.dart';

class TaskState implements Cloneable<TaskState> {
  TaskModel model;
  BuildContext context;

  @override
  TaskState clone() {
    return TaskState()
      ..model = model
      ..context = context;
  }
}

TaskState initState(Map<String, dynamic> args) {
  return TaskState();
}
