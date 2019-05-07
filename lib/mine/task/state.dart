import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:inspection/entity/todos_model.dart';

class TaskState implements Cloneable<TaskState> {
  ToDosModel model;
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
