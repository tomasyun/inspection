import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class InspectionTaskPage
    extends Page<InspectionTaskState, Map<String, dynamic>> {
  InspectionTaskPage()
      : super(
          initState: initState,
          effect: buildEffect(),
          reducer: buildReducer(),
          view: buildView,
          dependencies: Dependencies<InspectionTaskState>(
              adapter: null, slots: <String, Dependent<InspectionTaskState>>{}),
          middleware: <Middleware<InspectionTaskState>>[],
        );
}
