import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class HazardInfoFragPage
    extends Page<HazardInfoFragState, Map<String, dynamic>> {
  HazardInfoFragPage()
      : super(
          initState: initState,
          effect: buildEffect(),
          reducer: buildReducer(),
          view: buildView,
          dependencies: Dependencies<HazardInfoFragState>(
              adapter: null, slots: <String, Dependent<HazardInfoFragState>>{}),
          middleware: <Middleware<HazardInfoFragState>>[],
        );
}
