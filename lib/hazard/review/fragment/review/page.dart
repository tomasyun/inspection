import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class ReviewInfoFragPage
    extends Page<ReviewInfoFragState, Map<String, dynamic>> {
  ReviewInfoFragPage()
      : super(
          initState: initState,
          effect: buildEffect(),
          reducer: buildReducer(),
          view: buildView,
          dependencies: Dependencies<ReviewInfoFragState>(
              adapter: null, slots: <String, Dependent<ReviewInfoFragState>>{}),
          middleware: <Middleware<ReviewInfoFragState>>[],
        );
}
