import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

//功能
class FunctionPage extends Page<FunctionState, Map<String, dynamic>> {
  FunctionPage()
      : super(
          initState: initState,
          effect: buildEffect(),
          reducer: buildReducer(),
          view: buildView,
          dependencies: Dependencies<FunctionState>(
              adapter: null, slots: <String, Dependent<FunctionState>>{}),
          middleware: <Middleware<FunctionState>>[],
        );
}
