import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

//设备预警页
class WarningPage extends Page<WarningState, Map<String, dynamic>> {
  WarningPage()
      : super(
          initState: initState,
          effect: buildEffect(),
          reducer: buildReducer(),
          view: buildView,
          dependencies: Dependencies<WarningState>(
              adapter: null, slots: <String, Dependent<WarningState>>{}),
          middleware: <Middleware<WarningState>>[],
        );
}
