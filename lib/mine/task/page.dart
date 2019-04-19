import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

//我的任务
class TaskPage extends Page<TaskState, Map<String, dynamic>> {
  TaskPage()
      : super(
          initState: initState,
          effect: buildEffect(),
          reducer: buildReducer(),
          view: buildView,
          dependencies: Dependencies<TaskState>(
              adapter: null, slots: <String, Dependent<TaskState>>{}),
          middleware: <Middleware<TaskState>>[],
        );
}
