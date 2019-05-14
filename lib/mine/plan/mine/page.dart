import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class MinePlanPage extends Page<MinePlanState, Map<String, dynamic>> {
  MinePlanPage()
      : super(
          initState: initState,
          effect: buildEffect(),
          reducer: buildReducer(),
          view: buildView,
          dependencies: Dependencies<MinePlanState>(
              adapter: null, slots: <String, Dependent<MinePlanState>>{}),
          middleware: <Middleware<MinePlanState>>[],
        );
}
