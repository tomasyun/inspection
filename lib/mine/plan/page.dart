import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class InspectPlanPage extends Page<InspectPlanState, Map<String, dynamic>> {
  InspectPlanPage()
      : super(
          initState: initState,
          effect: buildEffect(),
          reducer: buildReducer(),
          view: buildView,
          dependencies: Dependencies<InspectPlanState>(
              adapter: null, slots: <String, Dependent<InspectPlanState>>{}),
          middleware: <Middleware<InspectPlanState>>[],
        );
}
