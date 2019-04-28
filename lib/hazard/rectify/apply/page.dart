import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class CostApplyPage extends Page<CostApplyState, Map<String, dynamic>> {
  CostApplyPage()
      : super(
          initState: initState,
          effect: buildEffect(),
          reducer: buildReducer(),
          view: buildView,
          dependencies: Dependencies<CostApplyState>(
              adapter: null, slots: <String, Dependent<CostApplyState>>{}),
          middleware: <Middleware<CostApplyState>>[],
        );
}
