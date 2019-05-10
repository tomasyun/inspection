import 'package:fish_redux/fish_redux.dart';
import 'package:inspection/mine/hazard/adapter/adapter.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class HazardHistoryPage extends Page<HazardHistoryState, Map<String, dynamic>> {
  HazardHistoryPage()
      : super(
          initState: initState,
          effect: buildEffect(),
          reducer: buildReducer(),
          view: buildView,
          dependencies:
              Dependencies<HazardHistoryState>(adapter: HazardHistoryAdapter()),
        );
}
