import 'package:fish_redux/fish_redux.dart';

import 'state.dart';
import 'view.dart';

//我的
class MinePage extends Page<MineState, Map<String, dynamic>> {
  MinePage()
      : super(
          initState: initState,
          view: buildView,
        );
}
