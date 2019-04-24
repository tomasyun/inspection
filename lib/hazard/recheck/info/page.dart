import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class RecheckInfoPage extends Page<RecheckInfoState, Map<String, dynamic>> {
  RecheckInfoPage()
      : super(
          initState: initState,
          effect: buildEffect(),
          reducer: buildReducer(),
          view: buildView,
          dependencies: Dependencies<RecheckInfoState>(
              adapter: null, slots: <String, Dependent<RecheckInfoState>>{}),
          middleware: <Middleware<RecheckInfoState>>[],
        );
}
