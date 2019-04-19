import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

//隐患查看
class ReviewPage extends Page<ReviewState, Map<String, dynamic>> {
  ReviewPage()
      : super(
          initState: initState,
          effect: buildEffect(),
          reducer: buildReducer(),
          view: buildView,
          dependencies: Dependencies<ReviewState>(
              adapter: null, slots: <String, Dependent<ReviewState>>{}),
          middleware: <Middleware<ReviewState>>[],
        );
}
