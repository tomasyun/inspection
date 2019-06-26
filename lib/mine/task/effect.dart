import 'package:fish_redux/fish_redux.dart';
import 'package:inspection/global/dico_http.dart';

import 'action.dart';
import 'state.dart';

Effect<TaskState> buildEffect() {
  return combineEffects(<Object, Effect<TaskState>>{
    Lifecycle.initState: _onGetToDos,
    TaskAction.action: _onAction,
  });
}

void _onAction(
  Action action,
  Context<TaskState> ctx,
) {}

void _onGetToDos(
  Action action,
  Context<TaskState> ctx,
) {
  ctx.state.context = ctx.context;
  DicoHttpRepository.doGetTodosRequest().then((model) {
    if (model.code == 0) {
      ctx.dispatch(TaskActionCreator.onGetToDos(model));
    }
  });
}
