import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class RectifyReportPage extends Page<RectifyReportState, Map<String, dynamic>> {
  RectifyReportPage()
      : super(
          initState: initState,
          effect: buildEffect(),
          reducer: buildReducer(),
          view: buildView,
          dependencies: Dependencies<RectifyReportState>(
              adapter: null, slots: <String, Dependent<RectifyReportState>>{}),
          middleware: <Middleware<RectifyReportState>>[],
        );
}
