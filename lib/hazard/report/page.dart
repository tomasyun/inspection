import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class HazardReportPage extends Page<HazardReportState, Map<String, dynamic>> {
  HazardReportPage()
      : super(
          initState: initState,
          effect: buildEffect(),
          reducer: buildReducer(),
          view: buildView,
          dependencies: Dependencies<HazardReportState>(
              adapter: null, slots: <String, Dependent<HazardReportState>>{}),
          middleware: <Middleware<HazardReportState>>[],
        );
}
