import 'package:fish_redux/fish_redux.dart';
import 'package:inspection/device/keep/adapter/adapter.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

//设备保养记录
class KeepPage extends Page<KeepState, Map<String, dynamic>> {
  KeepPage()
      : super(
          initState: initState,
          effect: buildEffect(),
          reducer: buildReducer(),
          view: buildView,
          dependencies: Dependencies<KeepState>(
            adapter: KeepRecordAdapter(),
          ),
        );
}
