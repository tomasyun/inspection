import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class FilterPage extends Page<FilterState, Map<String, dynamic>> {
  FilterPage()
      : super(
          initState: initState,
          effect: buildEffect(),
          reducer: buildReducer(),
          view: buildView,
          dependencies: Dependencies<FilterState>(
              adapter: null, slots: <String, Dependent<FilterState>>{}),
          middleware: <Middleware<FilterState>>[],
        );
}
