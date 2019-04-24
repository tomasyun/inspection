import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

//设备故障上报页
class ReportPage extends Page<ReportState, Map<String, dynamic>> {
  ReportPage()
      : super(
          initState: initState,
          effect: buildEffect(),
          reducer: buildReducer(),
          view: buildView,
          dependencies: Dependencies<ReportState>(
              adapter: null, slots: <String, Dependent<ReportState>>{}),
          middleware: <Middleware<ReportState>>[],
        );
}
