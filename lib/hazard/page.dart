import 'package:fish_redux/fish_redux.dart';
import 'package:inspection/hazard/adapter/adapter.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class HazardPage extends Page<HazardState, Map<String, dynamic>> {
  HazardPage()
      : super(
          initState: initState,
          effect: buildEffect(),
          reducer: buildReducer(),
          view: buildView,
          dependencies: Dependencies<HazardState>(adapter: HazardAdapter()),
        );
}
