import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

//检查内容
class ContentPage extends Page<ContentState, Map<String, dynamic>> {
  ContentPage()
      : super(
          initState: initState,
          effect: buildEffect(),
          reducer: buildReducer(),
          view: buildView,
          dependencies: Dependencies<ContentState>(
              adapter: null, slots: <String, Dependent<ContentState>>{}),
          middleware: <Middleware<ContentState>>[],
        );
}
