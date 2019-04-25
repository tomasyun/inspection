import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'state.dart';
import 'view.dart';

//功能
class FunctionPage extends Page<FunctionState, Map<String, dynamic>> {
  FunctionPage()
      : super(
          initState: initState,
          effect: buildEffect(),
          view: buildView,
        );
}
