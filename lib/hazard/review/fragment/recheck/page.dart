import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class RecheckInfoFragPage
    extends Page<RecheckInfoFragState, Map<String, dynamic>> {
  RecheckInfoFragPage()
      : super(
          initState: initState,
          effect: buildEffect(),
          reducer: buildReducer(),
          view: buildView,
          dependencies: Dependencies<RecheckInfoFragState>(
              adapter: null,
              slots: <String, Dependent<RecheckInfoFragState>>{}),
          middleware: <Middleware<RecheckInfoFragState>>[],
        );
}
