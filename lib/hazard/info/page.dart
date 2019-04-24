import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class HazardInfoPage extends Page<HazardInfoState, Map<String, dynamic>> {
  HazardInfoPage()
      : super(
          initState: initState,
          effect: buildEffect(),
          reducer: buildReducer(),
          view: buildView,
          dependencies: Dependencies<HazardInfoState>(
              adapter: null, slots: <String, Dependent<HazardInfoState>>{}),
          middleware: <Middleware<HazardInfoState>>[],
        );
}
