import 'package:fish_redux/fish_redux.dart';

import 'state.dart';
import 'view.dart';

class IndexPage extends Page<IndexState, Map<String, dynamic>> {
  IndexPage()
      : super(
          initState: initState,
          view: buildView,
          dependencies: Dependencies<IndexState>(
              adapter: null, slots: <String, Dependent<IndexState>>{}),
          middleware: <Middleware<IndexState>>[],
        );
}
