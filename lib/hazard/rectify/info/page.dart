import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class RectifyInfoPage extends Page<RectifyInfoState, Map<String, dynamic>> {
  RectifyInfoPage()
      : super(
          initState: initState,
          effect: buildEffect(),
          reducer: buildReducer(),
          view: buildView,
          dependencies: Dependencies<RectifyInfoState>(
              adapter: null, slots: <String, Dependent<RectifyInfoState>>{}),
          middleware: <Middleware<RectifyInfoState>>[],
        );
}
