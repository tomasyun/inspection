import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:inspection/global/dico_http.dart';
import 'package:inspection/mine/task/inspection/page.dart';

import 'action.dart';
import 'state.dart';

Effect<TaskState> buildEffect() {
  return combineEffects(<Object, Effect<TaskState>>{
    Lifecycle.initState: _onGetToDos,
    TaskAction.action: _onAction,
    TaskAction.scan: _onScanQRCode
  });
}

void _onAction(Action action, Context<TaskState> ctx) {}

void _onScanQRCode(Action action, Context<TaskState> ctx) {
  Navigator.of(ctx.context).push(MaterialPageRoute(builder: (content) {
    return InspectionTaskPage().buildPage(null);
  }));
}

void _onGetToDos(Action action, Context<TaskState> ctx) {
  ctx.state.context = ctx.context;
  DicoHttpRepository.doGetTodosRequest().then((model) {
    ctx.dispatch(TaskActionCreator.onGetToDos(model));
  });
}
