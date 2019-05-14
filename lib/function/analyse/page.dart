import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class SaveAnalysePage extends Page<SaveAnalyseState, Map<String, dynamic>> {
  SaveAnalysePage()
      : super(
          initState: initState,
          effect: buildEffect(),
          reducer: buildReducer(),
          view: buildView,
          dependencies: Dependencies<SaveAnalyseState>(
              adapter: null, slots: <String, Dependent<SaveAnalyseState>>{}),
          middleware: <Middleware<SaveAnalyseState>>[],
        );
}
