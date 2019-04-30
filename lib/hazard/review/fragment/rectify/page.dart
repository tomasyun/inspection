import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class RectifyInfoFragPage
    extends Page<RectifyInfoFragState, Map<String, dynamic>> {
  RectifyInfoFragPage()
      : super(
          initState: initState,
          effect: buildEffect(),
          reducer: buildReducer(),
          view: buildView,
          dependencies: Dependencies<RectifyInfoFragState>(
              adapter: null,
              slots: <String, Dependent<RectifyInfoFragState>>{}),
          middleware: <Middleware<RectifyInfoFragState>>[],
        );
}
