import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

//我的整改
class RectifyPage extends Page<RectifyState, Map<String, dynamic>> {
  RectifyPage()
      : super(
          initState: initState,
          effect: buildEffect(),
          reducer: buildReducer(),
          view: buildView,
          dependencies: Dependencies<RectifyState>(
              adapter: null, slots: <String, Dependent<RectifyState>>{}),
          middleware: <Middleware<RectifyState>>[],
        );
}
