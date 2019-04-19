import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

//设备故障维修页
class RepairPage extends Page<RepairState, Map<String, dynamic>> {
  RepairPage()
      : super(
          initState: initState,
          effect: buildEffect(),
          reducer: buildReducer(),
          view: buildView,
          dependencies: Dependencies<RepairState>(
              adapter: null, slots: <String, Dependent<RepairState>>{}),
          middleware: <Middleware<RepairState>>[],
        );
}
