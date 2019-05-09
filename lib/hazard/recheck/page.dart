import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class RecheckReportPage extends Page<RecheckReportState, Map<String, dynamic>> {
  RecheckReportPage()
      : super(
            initState: initState,
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<RecheckReportState>(
                adapter: null,
                slots: <String, Dependent<RecheckReportState>>{
                }),
            middleware: <Middleware<RecheckReportState>>[
            ],);

}
