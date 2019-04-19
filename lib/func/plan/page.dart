import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

//检查计划页
class PlanPage extends Page<PlanState, Map<String, dynamic>> {
  PlanPage()
      : super(
          initState: initState,
          effect: buildEffect(),
          reducer: buildReducer(),
          view: buildView,
          dependencies: Dependencies<PlanState>(
              adapter: null, slots: <String, Dependent<PlanState>>{}),
          middleware: <Middleware<PlanState>>[],
        );
}
