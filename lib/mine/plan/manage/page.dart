import 'package:fish_redux/fish_redux.dart';
import 'package:inspection/mine/plan/manage/effect.dart';
import 'package:inspection/mine/plan/manage/reducer.dart';
import 'package:inspection/mine/plan/manage/state.dart';
import 'package:inspection/mine/plan/manage/view.dart';

class InspectPlanPage extends Page<InspectPlanState, Map<String, dynamic>> {
  InspectPlanPage()
      : super(
          initState: initState,
          effect: buildEffect(),
          reducer: buildReducer(),
          view: buildView,
          dependencies: Dependencies<InspectPlanState>(
              adapter: null, slots: <String, Dependent<InspectPlanState>>{}),
          middleware: <Middleware<InspectPlanState>>[],
        );
}
