import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

//计划详情页
class DetailPage extends Page<DetailState, Map<String, dynamic>> {
  DetailPage()
      : super(
          initState: initState,
          effect: buildEffect(),
          reducer: buildReducer(),
          view: buildView,
          dependencies: Dependencies<DetailState>(
              adapter: null, slots: <String, Dependent<DetailState>>{}),
          middleware: <Middleware<DetailState>>[],
        );
}
