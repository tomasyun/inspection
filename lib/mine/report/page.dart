import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class ReportRecordPage extends Page<ReportRecordState, Map<String, dynamic>> {
  ReportRecordPage()
      : super(
          initState: initState,
          effect: buildEffect(),
          reducer: buildReducer(),
          view: buildView,
          dependencies: Dependencies<ReportRecordState>(
              adapter: null, slots: <String, Dependent<ReportRecordState>>{}),
          middleware: <Middleware<ReportRecordState>>[],
        );
}
