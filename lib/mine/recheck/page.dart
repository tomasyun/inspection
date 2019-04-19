import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

//我的复查
class RecheckPage extends Page<RecheckState, Map<String, dynamic>> {
  RecheckPage()
      : super(
          initState: initState,
          effect: buildEffect(),
          reducer: buildReducer(),
          view: buildView,
          dependencies: Dependencies<RecheckState>(
              adapter: null, slots: <String, Dependent<RecheckState>>{}),
          middleware: <Middleware<RecheckState>>[],
        );
}
