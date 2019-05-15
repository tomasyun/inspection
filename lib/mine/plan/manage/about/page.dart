import 'package:fish_redux/fish_redux.dart';
import 'package:inspection/mine/plan/manage/about/adapter/adapter.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class PlanAboutPage extends Page<PlanAboutState, Map<String, dynamic>> {
  PlanAboutPage()
      : super(
          initState: initState,
          effect: buildEffect(),
          reducer: buildReducer(),
          view: buildView,
          dependencies: Dependencies<PlanAboutState>(
            adapter: PlanAboutAdapter(),
          ),
        );
}
